import pytest

from free_claude_code.config.provider_catalog import PROVIDER_CATALOG
from free_claude_code.config.settings import Settings
from free_claude_code.providers.openai_chat.profiles import OPENAI_CHAT_PROFILES
from free_claude_code.providers.runtime.factory import create_provider


def test_hcnsec_provider_descriptor() -> None:
    descriptor = PROVIDER_CATALOG["hcnsec"]

    assert descriptor.provider_id == "hcnsec"
    assert descriptor.credential_env == "HCNSEC_API_KEY"
    assert descriptor.credential_attr == "hcnsec_api_key"
    assert descriptor.default_base_url == "https://api.hcnsec.cn/v1"
    assert descriptor.base_url_attr == "hcnsec_base_url"
    assert descriptor.proxy_attr == "hcnsec_proxy"


def test_hcnsec_settings_mapping() -> None:
    settings = Settings(
        HCNSEC_API_KEY="sk-hcnsec",
        HCNSEC_BASE_URL="https://custom.api.hcnsec.cn/v1",
        HCNSEC_PROXY="http://proxy:8080",
    )
    assert settings.hcnsec_api_key == "sk-hcnsec"
    assert settings.hcnsec_base_url == "https://custom.api.hcnsec.cn/v1"
    assert settings.hcnsec_proxy == "http://proxy:8080"


def test_hcnsec_empty_settings() -> None:
    settings = Settings()
    assert settings.hcnsec_api_key == ""
    assert settings.hcnsec_base_url == "https://api.hcnsec.cn/v1"
    assert settings.hcnsec_proxy == ""


def test_hcnsec_provider_registry() -> None:
    settings = Settings(HCNSEC_API_KEY="sk-hcnsec")
    provider = create_provider("hcnsec", settings)

    assert provider.provider_name == "hcnsec"
    assert provider.config.bearer_token == "sk-hcnsec"
    assert provider.config.base_url == "https://api.hcnsec.cn/v1"


def test_hcnsec_profile_exists() -> None:
    assert "hcnsec" in OPENAI_CHAT_PROFILES
    profile = OPENAI_CHAT_PROFILES["hcnsec"]
    assert profile.provider_name == "HCNSEC"
    assert not profile.normalize_base_url
