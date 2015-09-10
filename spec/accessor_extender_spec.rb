require 'spec_helper'

describe AccessorExtender do
  it 'has a version number' do
    expect(AccessorExtender::VERSION).not_to be nil
  end

  it 'mattr_accessor' do
    class Foo
      mattr_accessor :foo
    end

    foo = Foo.new
    expect(Foo.respond_to?(:foo)).to eq true
    expect(Foo.respond_to?(:foo=)).to eq true
    Foo.foo= 'hoge'
    
    class Bar < Foo
    end

    bar = Bar.new
    expect(Bar.respond_to?(:foo)).to eq true
    expect(Bar.respond_to?(:foo=)).to eq true
    expect(Bar.foo).to eq 'hoge'
  end

  it 'cattr_accessor' do
    class Foo
      cattr_accessor :foo
    end

    foo = Foo.new
    expect(Foo.respond_to?(:foo)).to eq true
    expect(Foo.respond_to?(:foo=)).to eq true
    Foo.foo= 'hoge'
    
    class Bar < Foo
    end

    bar = Bar.new
    expect(Bar.respond_to?(:foo)).to eq true
    expect(Bar.respond_to?(:foo=)).to eq true
    expect(Bar.foo).to eq 'hoge'
  end

end
