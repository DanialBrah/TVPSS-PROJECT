package entity;

import java.time.LocalDateTime;
import java.util.List;
import java.time.ZoneId;
import java.util.Date;
import javax.persistence.*;

@Entity
@Table(name = "school")
public class School {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "school_id")
    private int id;

    @Column(name = "school_name")
    private String name;

    @Column(name = "address")
    private String address;

    @Column(name = "contact")
    private String contact;

    @Column(name = "version")
    private String version;

    @Column(name = "equipment_updated_at")
    private LocalDateTime equipmentUpdatedAt;

    @OneToMany(mappedBy = "school", cascade = CascadeType.ALL)
    private List<Activity> activities;

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public LocalDateTime getEquipmentUpdatedAt() {
        return equipmentUpdatedAt;
    }

    public void setEquipmentUpdatedAt(LocalDateTime equipmentUpdatedAt) {
        this.equipmentUpdatedAt = equipmentUpdatedAt;
    }
    
 // Utility method to convert LocalDateTime to Date
    @Transient
    public Date getEquipmentUpdatedAtAsDate() {
        if (equipmentUpdatedAt != null) {
            return Date.from(equipmentUpdatedAt.atZone(ZoneId.systemDefault()).toInstant());
        }
        return null;
    }

    public List<Activity> getActivities() {
        return activities;
    }

    public void setActivities(List<Activity> activities) {
        this.activities = activities;
    }
}
