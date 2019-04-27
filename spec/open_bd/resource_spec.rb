require "spec_helper"
require "json"

RSpec.describe OpenBD do
  let(:source) { JSON.parse(File.read("spec/data/9784062206976.json")) }
  let(:resource) { OpenBD::Resource.new(source) }

  describe "#author" do
    subject { resource.author }
    it { is_expected.to eq "神崎正哉／著" }
  end

  describe "#contents" do
    subject { resource.contents }
    it { is_expected.to eq "ＴＯＥＩＣ　Ｌ＆Ｒの頻出単語が効率よく学べる！あのベストセラー語句集のハンディ版がついに登場！" }
  end

  describe "#contributors" do
    subject { resource.contributors.all? { |c| c.is_a?(OpenBD::Contributor) } }
    it { is_expected.to be_truthy }
  end

  describe "#title" do
    subject { resource.title }
    it { is_expected.to eq "新TOEIC　TEST　出る順で学ぶ　ボキャブラリー990　ハンディ版"}
  end

  describe "#publisher" do
    subject { resource.publisher }
    it { is_expected.to eq "講談社"}
  end
end
