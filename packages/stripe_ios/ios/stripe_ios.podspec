Pod::Spec.new do |s|
  s.name             = 'stripe_ios'
  s.version          = '0.0.1'
  s.summary          = 'Flutter Stripe iOS plugin using Agisight fork'
  s.description      = 'A customized version of Stripe iOS SDK via Agisight fork.'
  s.homepage         = 'https://github.com/Agisight/flutter_stripe'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Agisight' => 'email@example.com' }
  s.source           = { :path => '.' }

  s.platform         = :ios, '13.0'
  s.swift_version    = '5.0'
  s.dependency 'Flutter'

  # 👇 Здесь ты указываешь свой форк Stripe iOS
  s.dependency 'Stripe',
               :git => 'https://github.com/Agisight/stripe-ios.git',
               :branch => 'lim'
  s.dependency 'StripePaymentSheet',
               :git => 'https://github.com/Agisight/stripe-ios.git',
               :branch => 'lim'
  s.dependency 'StripePayments',
               :git => 'https://github.com/Agisight/stripe-ios.git',
               :branch => 'lim'
  s.dependency 'StripePaymentsUI',
               :git => 'https://github.com/Agisight/stripe-ios.git',
               :branch => 'lim'
  s.dependency 'StripeApplePay',
               :git => 'https://github.com/Agisight/stripe-ios.git',
               :branch => 'lim'
  s.dependency 'StripeFinancialConnections',
               :git => 'https://github.com/Agisight/stripe-ios.git',
               :branch => 'lim'

  s.subspec 'stripe_objc' do |ss|
    ss.source_files = 'stripe_ios/Sources/**/*.{m,h}'
    ss.public_header_files = 'stripe_ios/Sources/stripe_objc/include/**/*.h'
  end

  s.subspec 'stripe_ios' do |ss|
    ss.source_files = 'stripe_ios/Sources/**/*.{swift}'
    ss.dependency 'stripe_ios/stripe_objc'
  end

  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
end
