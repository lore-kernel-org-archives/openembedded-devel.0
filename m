Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 6457C6059E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Nov 2017 14:51:07 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1509720669; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=tzvwuRLYfRzjdKN876OlLjLMwy8kvXKVivjTuaykaWM=;
	b=w17UQ8odYatIdzDdHKbwg1LwUtUjGRzeatVSJs8mUflRKFsGbVa0aP+F+3uJE0ySjku4iVgI
	UEqU2b0Lx45XSlBRotCpuY6kWG5IshvDXh6Dtu7VXxyu3fGPL2FJAjL0zWzk3Zjs4yjnchx8
	SVhoulY6nFhuUs0eihEwidv/+w4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Cc: Content-Type;
	b=d1VhKnvsjHODp6gr2bLjfsOEoYfSmiz830Jc07pXoyUzdKH90aUyC6RvFZmOOG5PFbTxYQ
	kjzOeZYWaWs3FW1pTzRBJHfF3YckodRvjWfILZg883ZunBztq96onANmlbh6DdhM2a8aSNye
	jxCxF0rJS07xcvJ1OoP0tt24JxP8g=
Sender: derek@asterius.io
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mxa.mailgun.org with ESMTP id 59fc812e.7f9d0d479030-smtp-out-n03;
	Fri, 03 Nov 2017 14:46:06 -0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id w134so3496451qkb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Nov 2017 07:46:06 -0700 (PDT)
X-Gm-Message-State: AMCzsaX3q1/tILRe6XdoaiJkFsRfKzInwjwnBDV6rOjpJ4rfHQJyaHrC
	/w3JegwenanpI/0CkOjie5GyEY070PsZ//M0HfU=
X-Google-Smtp-Source: ABhQp+S7gCCmYPDxo7EY84QuwoHCuC9zsiHOSyJJqqRsA46CsfuJDgo8ttYUjJsQvDQe4RZwwvwx/GBPwBWz8jJcX3g=
X-Received: by 10.55.129.70 with SMTP id c67mr10467845qkd.230.1509720365842;
	Fri, 03 Nov 2017 07:46:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.21.165 with HTTP; Fri, 3 Nov 2017 07:46:05 -0700 (PDT)
In-Reply-To: <1509720157-17531-1-git-send-email-pascal.bach@siemens.com>
References: <1509720157-17531-1-git-send-email-pascal.bach@siemens.com>
From: Derek Straka <derek@asterius.io>
Date: Fri, 3 Nov 2017 10:46:05 -0400
X-Gmail-Original-Message-ID: <CADNbA1p_wLb-pbUQe7Y17RxEUhR+Dqty_=JiTHXrqo8+JAbFMQ@mail.gmail.com>
Message-ID: <CADNbA1p_wLb-pbUQe7Y17RxEUhR+Dqty_=JiTHXrqo8+JAbFMQ@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Pascal Bach <pascal.bach@nextrem.ch>
Subject: Re: [meta-python][PATCH] python-paho-mqtt, python3-paho-mqtt: update to 1.3.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Nov 2017 14:51:07 -0000
Content-Type: text/plain; charset="UTF-8"

Patch pending inclusion: http://lists.openembedded.org/
pipermail/openembedded-devel/2017-October/115337.html

On Fri, Nov 3, 2017 at 10:42 AM, Pascal Bach <pascal.bach@siemens.com>
wrote:

> From: Pascal Bach <pascal.bach@nextrem.ch>
>
> Signed-off-by: Pascal Bach <pascal.bach@nextrem.ch>
> ---
>  meta-python/recipes-devtools/python/python-paho-mqtt.inc              |
> 4 ++--
>  .../python/{python-paho-mqtt_1.3.0.bb => python-paho-mqtt_1.3.1.bb}   | 0
>  .../python/{python3-paho-mqtt_1.3.0.bb => python3-paho-mqtt_1.3.1.bb} | 0
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-paho-mqtt_1.3.0.bb =>
> python-paho-mqtt_1.3.1.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-paho-mqtt_1.3.0.bb
> => python3-paho-mqtt_1.3.1.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-paho-mqtt.inc
> b/meta-python/recipes-devtools/python/python-paho-mqtt.inc
> index ad1ce6a..9efbd2f 100644
> --- a/meta-python/recipes-devtools/python/python-paho-mqtt.inc
> +++ b/meta-python/recipes-devtools/python/python-paho-mqtt.inc
> @@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=
> eb48c6ee2cb9f5b8b9fe75e6f817bdfc \
>  SRCNAME = "paho-mqtt"
>
>  inherit pypi
> -SRC_URI[md5sum] = "b9338236e2836e8579ef140956189cc4"
> -SRC_URI[sha256sum] = "2c9ef5494cfc1e41a9fff6544c5a2c
> d59ea5d401d9119a06ecf7fad6a2ffeb93"
> +SRC_URI[md5sum] = "2cc27d8b369700b1fc99325add0dadd2"
> +SRC_URI[sha256sum] = "31911f6031de306c27ed79dc77b690
> d7c55b0dcb0f0434ca34ec6361d0371122"
>
>  DEPENDS += "${PYTHON_PN}-pytest-runner-native"
>
> diff --git a/meta-python/recipes-devtools/python/python-paho-mqtt_1.3.0.bb
> b/meta-python/recipes-devtools/python/python-paho-mqtt_1.3.1.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-paho-mqtt_1.3.0.bb
> rename to meta-python/recipes-devtools/python/python-paho-mqtt_1.3.1.bb
> diff --git a/meta-python/recipes-devtools/python/python3-paho-
> mqtt_1.3.0.bb b/meta-python/recipes-devtools/python/python3-paho-
> mqtt_1.3.1.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python3-paho-mqtt_1.3.0.bb
> rename to meta-python/recipes-devtools/python/python3-paho-mqtt_1.3.1.bb
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

