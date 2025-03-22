import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input"]

  // Store the original content
  originalContent = ""

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
    templateSection.style.display = "block"; // Show preview section

    // Store the current content before applying template (for undo)
    this.originalContent = this.inputTarget.value;
  }

  useTemplate() {
    let previewContent = document.getElementById("template_content").innerText.trim();
    if (previewContent) {
      this.inputTarget.value = previewContent;  // Update the message content field
    }
    // Hide the template section after applying the template
    document.getElementById("template_section").style.display = "none";
  }

  undoTemplate() {
    // Revert to the original content
    if (this.originalContent) {
      this.inputTarget.value = this.originalContent;
    }
  }
}
