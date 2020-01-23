package de.chludwig.websec.bbcode;

import org.apache.commons.lang3.StringUtils;
import org.kefirsf.bb.BBProcessorFactory;
import org.kefirsf.bb.TextProcessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/")
public class BBCodeController {
    private static final String FORM_SUBMISSION_URL = "/submitForm";
    private static final String LINEBREAK_REGEXP = "\\r?\\n|\\r[^\\n]";
    private static final String KEFIRCONFIG_PATH = "de/chludwig/websec/bbcode/kefirconfig.xml";

    private final TextProcessor bbCodeProcessor;

    public BBCodeController() {
        BBProcessorFactory processorFactory = BBProcessorFactory.getInstance();
        bbCodeProcessor = processorFactory.createFromResource(KEFIRCONFIG_PATH);
    }


    @RequestMapping(method = RequestMethod.GET)
	public String printForm(HttpServletRequest request, ModelMap model) {
        model.addAttribute("formSubmissionUrl", getFormSubmissionUrl(request));
		return "bbcodeform";
	}

    @RequestMapping(value = FORM_SUBMISSION_URL, method = RequestMethod.POST)
    public String processInput(@RequestParam(value = "bbcodeinput", defaultValue = "") String bbCodeInput,
                               HttpServletRequest request, ModelMap model) {
        String processedBbCode = bbCodeProcessor.process(bbCodeInput);

        model.addAttribute("rawMarkupLines", splitLines(bbCodeInput));
        model.addAttribute("processedMarkup", processedBbCode);
        model.addAttribute("rootUrl", getRootUrl(request));
        return "bbcoderesult";
    }

    private List<String> splitLines(String sanitizedInput) {
        return Arrays.asList(sanitizedInput.split(LINEBREAK_REGEXP));
    }

    private String getFormSubmissionUrl(HttpServletRequest request) {
        return request.getContextPath() + FORM_SUBMISSION_URL;
    }

    private String getRootUrl(HttpServletRequest request) {
        String contextPath = request.getContextPath();
        return StringUtils.isEmpty(contextPath) ? "/" : contextPath;
    }
}
