package entity;

import javax.persistence.*;

@Entity
@Table(name = "criteria")
public class Criteria {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@Column(name = "has_name")
	private boolean hasName;

	@Column(name = "has_logo")
	private boolean hasLogo;

	@Column(name = "has_studio")
	private boolean hasStudio;

	@Column(name = "has_in_school_recording")
	private boolean hasInSchoolRecording;

	@Column(name = "has_youtube_upload")
	private boolean hasYoutubeUpload;

	@Column(name = "has_outside_recording")
	private boolean hasOutsideRecording;

	@Column(name = "has_external_collaboration")
	private boolean hasExternalCollaboration;

	@Column(name = "has_green_screen")
	private boolean hasGreenScreen;

	@Column(name = "version")
	private int version;

	@ManyToOne
	@JoinColumn(name = "school_id")
	private School school;

	@Column(name = "status")
	private String status = "Pending"; // Default value is Pending

	// Getters and Setters
	public Criteria() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public boolean isHasName() {
		return hasName;
	}

	public void setHasName(boolean hasName) {
		this.hasName = hasName;
	}

	public boolean isHasLogo() {
		return hasLogo;
	}

	public void setHasLogo(boolean hasLogo) {
		this.hasLogo = hasLogo;
	}

	public boolean isHasStudio() {
		return hasStudio;
	}

	public void setHasStudio(boolean hasStudio) {
		this.hasStudio = hasStudio;
	}

	public boolean isHasInSchoolRecording() {
		return hasInSchoolRecording;
	}

	public void setHasInSchoolRecording(boolean hasInSchoolRecording) {
		this.hasInSchoolRecording = hasInSchoolRecording;
	}

	public boolean isHasYoutubeUpload() {
		return hasYoutubeUpload;
	}

	public void setHasYoutubeUpload(boolean hasYoutubeUpload) {
		this.hasYoutubeUpload = hasYoutubeUpload;
	}

	public boolean isHasOutsideRecording() {
		return hasOutsideRecording;
	}

	public void setHasOutsideRecording(boolean hasOutsideRecording) {
		this.hasOutsideRecording = hasOutsideRecording;
	}

	public boolean isHasExternalCollaboration() {
		return hasExternalCollaboration;
	}

	public void setHasExternalCollaboration(boolean hasExternalCollaboration) {
		this.hasExternalCollaboration = hasExternalCollaboration;
	}

	public boolean isHasGreenScreen() {
		return hasGreenScreen;
	}

	public void setHasGreenScreen(boolean hasGreenScreen) {
		this.hasGreenScreen = hasGreenScreen;
	}

	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

	public School getSchool() {
		return school;
	}

	public void setSchool(School school) {
		this.school = school;
	}

	// Add getter and setter
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}