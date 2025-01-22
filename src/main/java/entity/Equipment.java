// Equipment.java
package entity;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "Equipment")
public class Equipment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "equipment_id")
	private int equipmentId;

	@Column(name = "equipment_name", length = 100, nullable = false)
	private String equipmentName;

	@Column(name = "quantity", nullable = false)
	private int quantity;

	@Column(name = "last_maintenance_date")
	private LocalDate lastMaintenanceDate;

	@Column(name = "image_url", length = 255)
	private String imageUrl;

	@Column(name = "status")
	private String status;

	@ManyToOne
	@JoinColumn(name = "school_id", nullable = false)
	private School school;

	@Override
	public String toString() {
		return "Equipment [equipmentId=" + equipmentId + ", school=" + school + ", equipmentName=" + equipmentName
				+ ", quantity=" + quantity + ", lastMaintenanceDate=" + lastMaintenanceDate + ", imageUrl=" + imageUrl
				+ "]";
	}

	// Getters and setters
	public int getEquipmentId() {
		return equipmentId;
	}

	public void setEquipmentId(int equipmentId) {
		this.equipmentId = equipmentId;
	}

	public School getSchool() {
		return school;
	}

	public void setSchool(School school) {
		this.school = school;
	}

	public String getEquipmentName() {
		return equipmentName;
	}

	public void setEquipmentName(String equipmentName) {
		this.equipmentName = equipmentName;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public LocalDate getLastMaintenanceDate() {
		return lastMaintenanceDate;
	}

	public void setLastMaintenanceDate(LocalDate lastMaintenanceDate) {
		this.lastMaintenanceDate = lastMaintenanceDate;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}