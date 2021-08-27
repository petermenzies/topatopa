sio2_site <- combined_data %>% 
  select(sample_date, si_o2, sample_id) %>% 
  mutate(sample_date = year(sample_date)) %>%
  mutate(sample_date = as.Date(ISOdate(sample_date, 1, 1))) %>% 
  group_by(sample_date, sample_id) %>%
  summarize(si_o2 = mean(si_o2, na.rm = TRUE))

hurricane <- as.Date("1989-09-15")

ggplot(sio2_site, aes(x = sample_date, y = si_o2)) +
  geom_line(aes(color = sample_id), size = 1) +
  labs(title = "SiO2 concentrations over time in four Luquillo Experimental \n Forest watershed study sites") +
  geom_vline(xintercept = hurricane, linetype = "dashed")