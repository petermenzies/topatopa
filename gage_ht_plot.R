# Subset of data just for gage height and added a rectangle representing when the hurricane hit

gage_df <- combined_data %>% 
  select(sample_id, sample_date, gage_ht) %>% 
  mutate(year = year(sample_date)) %>% 
  filter(year >= 1988 & year < 1995) %>% 
  mutate(date = ymd(sample_date)) # made a new column called date which is class date

# assigning object representing hurricane date
hurricane <- as.Date("1989-09-18")


gage_plot <- ggplot(gage_df, aes(x = date, y = gage_ht)) +
  geom_vline(xintercept = hurricane, linetype = "dashed") + #line representing hurricane
  geom_line(aes(color = sample_id)) +
  labs(color = "Site") +
  labs(y = "Gage height (m)", x = element_blank()) +
  theme_minimal() +
  theme(axis.text.x = element_blank())


gage_plot
