import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["messageField", "templatePreview", "templateSelect"]

  // Store the original content
  originalContent = ""

  connect() {
    this.autoResize()
  }

  autoResize() {
    console.log('test')
    this.messageFieldTarget.addEventListener("input", () => {
      this.messageFieldTarget.style.height = "auto";
      this.messageFieldTarget.style.height = `${this.messageFieldTarget.scrollHeight}px`;
    });
  }

  async loadTemplate(event) {
    let templateId = event.target.value;
    let templateSection = document.getElementById("template_section");

    if (!templateId) {
      templateSection.style.display = "none";
      return;
    }

    // Fetch template preview
    const response = await fetch(`/message_templates/${templateId}`);
    const data = await response.text();

    document.getElementById("template_content").innerHTML = data;
    templateSection.style.display = "block";

    // Auto-focus the template textarea if it exists
    let templateTextarea = templateSection.querySelector("textarea");
    if (templateTextarea) {
      setTimeout(() => templateTextarea.focus(), 100); // Small delay for DOM updates
    }
  }

  useTemplate() {
    let templateText = this.templatePreviewTarget.querySelector("textarea");

    if (templateText) {
      this.messageFieldTarget.value = templateText.value.trim();

      // Auto-focus for better UX
      this.messageFieldTarget.focus();
    }
    
    // Hide the template section after applying the template
    // document.getElementById("template_section").style.display = "none";

    // Smooth fade-out before hiding
    let templateSection = this.templatePreviewTarget.closest("#template_section");
    templateSection.style.opacity = "0";
    setTimeout(() => (templateSection.style.display = "none"), 500);

    // Reset the dropdown selection to its default prompt value
    this.templateSelectTarget.value = "";
  }

}
