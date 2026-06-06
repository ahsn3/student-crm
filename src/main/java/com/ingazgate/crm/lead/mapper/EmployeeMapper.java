package com.ingazgate.crm.lead.mapper;

import com.ingazgate.crm.lead.dto.EmployeeResponse;
import com.ingazgate.crm.lead.entity.Employee;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface EmployeeMapper {
  EmployeeResponse toResponse(Employee employee);
}
