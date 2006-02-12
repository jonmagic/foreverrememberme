require File.dirname(__FILE__) + '/../test_helper'
require 'notifications'

class NotificationsTest < Test::Unit::TestCase
  FIXTURES_PATH = File.dirname(__FILE__) + '/../fixtures'
  CHARSET = "utf-8"

  include ActionMailer::Quoting

  def setup
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []

    @expected = TMail::Mail.new
    @expected.set_content_type "text", "plain", { "charset" => CHARSET }
  end

  def test_signup
    @expected.subject = 'Notifications#signup'
    @expected.body    = read_fixture('signup')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Notifications.create_signup(@expected.date).encoded
  end

  def test_anniversary
    @expected.subject = 'Notifications#anniversary'
    @expected.body    = read_fixture('anniversary')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Notifications.create_anniversary(@expected.date).encoded
  end

  def test_renew_memorial
    @expected.subject = 'Notifications#renew_memorial'
    @expected.body    = read_fixture('renew_memorial')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Notifications.create_renew_memorial(@expected.date).encoded
  end

  def test_thankyou_for_purchasing_memorial
    @expected.subject = 'Notifications#thankyou_for_purchasing_memorial'
    @expected.body    = read_fixture('thankyou_for_purchasing_memorial')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Notifications.create_thankyou_for_purchasing_memorial(@expected.date).encoded
  end

  def test_complaint
    @expected.subject = 'Notifications#complaint'
    @expected.body    = read_fixture('complaint')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Notifications.create_complaint(@expected.date).encoded
  end

  private
    def read_fixture(action)
      IO.readlines("#{FIXTURES_PATH}/notifications/#{action}")
    end

    def encode(subject)
      quoted_printable(subject, CHARSET)
    end
end
