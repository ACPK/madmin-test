import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input"]  // Here, we're targeting the message input field

  async loadTemplate(event) {
    let templateId = event.target.value;
    let templateSection = document.getElementById("template_section");

    if (!templateId) {
      templateSection.style.display = "none"; // Hide if no template is selected
      return;
    }

    // Fetch template preview
    const response = await fetch(`/message_templates/${templateId}`);
    const data = await response.text();

    document.getElementById("template_content").innerHTML = data;
    templateSection.style.display = "block"; // Show preview section
  }

  useTemplate() {
    let preview = document.getElementById("template_content").innerText.trim();
    if (preview) {
      this.inputTarget.value = preview;  // Here we use inputTarget to target the text area
    }
  }
}
