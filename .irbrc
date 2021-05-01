# frozen_string_literal: true

IRB.conf[:PROMPT][:CUSTOM] = {
  PROMPT_I: "%M \e[35m❯\e[0m ",
  PROMPT_S: "%l\e[35m❯\e[0m ",
  PROMPT_C: "%M \e[35m❯\e[0m ",
  PROMPT_N: "%M \e[35m❯\e[0m ",
  RETURN: "=> %s\n"
}
IRB.conf[:PROMPT_MODE] = :CUSTOM
