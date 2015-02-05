Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f175.google.com (mail-yk0-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id D152765C75
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Feb 2015 17:27:46 +0000 (UTC)
Received: by mail-yk0-f175.google.com with SMTP id 9so3764617ykp.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Feb 2015 09:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=BAN+BQhxpzRGPkOfyhnYZDW9xK5dRm49Aid3xV+zENc=;
	b=YN3hSd1rGCv6fsRXLMfzqo5srVv9qXl/A2XsqL7sdvQh+6LV7cOaiZkTcML1TzXk+L
	8w4NIk2vYMj/qMq01DpHZFclWj726i0GV+MkGkHHsY62FcAiRfUit506N3+wCCIkYYys
	RbZszIM0E+OPt6jvcf7C+EK4uzdjsq7KF8oS+3USaCMzGDC1R+d2Wc4uv8FSyP6c0bVT
	BdK1S1j383wchMs2neoWc72DE4bKliZySE4TUcm4ccc5JswMJ0JpAX+QmsRuXDsKytYV
	Cw9Q5jdMgFy96TPsIgBDr4dChlcPynzuup5BkZfnxLhvRllF8ZYyiUb8xoOsP7OJbMh6
	8tIg==
MIME-Version: 1.0
X-Received: by 10.236.199.103 with SMTP id w67mr2017151yhn.37.1423157267364;
	Thu, 05 Feb 2015 09:27:47 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.143 with HTTP; Thu, 5 Feb 2015 09:27:47 -0800 (PST)
In-Reply-To: <CAENGNhd58fiBF81D6V8H7uSjmmVeVx8-oWU=Pn32OwJs1EStDA@mail.gmail.com>
References: <1422338033-18521-1-git-send-email-schnitzeltony@googlemail.com>
	<1422338033-18521-5-git-send-email-schnitzeltony@googlemail.com>
	<CAENGNhfzVESxGmQVz3SA6gGv_H+NBE+q9J+FB=Zg1J4WHdg=CQ@mail.gmail.com>
	<CALbNGRQEfMiaVMKVVFnUFdZNokBQ=F5eQCDe7o75H507=uwHvg@mail.gmail.com>
	<CALbNGRRSRUewugNgWeQqguEgHMjmiLetzi=v6rqWXYXy4WJ=Vw@mail.gmail.com>
	<CAENGNhd58fiBF81D6V8H7uSjmmVeVx8-oWU=Pn32OwJs1EStDA@mail.gmail.com>
Date: Thu, 5 Feb 2015 15:27:47 -0200
X-Google-Sender-Auth: WH6vmfii3of3C3uRKFn1GOXnCVc
Message-ID: <CAP9ODKpMwfn83T=aXWxd49GcVEN4Uw3nuHW+2YKgADNMo-K=gQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 4/5] qt5-creator: add 3.3.0 of qt-creator
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Feb 2015 17:27:53 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 5, 2015 at 3:22 PM, Raphael Philipe <rapphil@gmail.com> wrote:
> In my local.conf I used:
>
>  PACKAGECONFIG_append_pn-qtbase = "accessibility"

PACKAGECONFIG_append_pn-qtbase = "<space>accessibility"

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

