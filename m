Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 53B0B65EA8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 01:39:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4D1du2B015418
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 May 2014 18:39:56 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Mon, 12 May 2014 18:39:56 -0700
Message-ID: <537177E9.8050304@windriver.com>
Date: Tue, 13 May 2014 09:39:53 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <cover.1399888012.git.Chong.Lu@windriver.com>	<75b920fb6189f84ff81fcfe0b89747f18079ed07.1399888012.git.Chong.Lu@windriver.com>
	<CAJTo0LaeVp=h34O9=RFU2mR54NhBsEH1fMyq=kgJHt21EPm1jA@mail.gmail.com>
In-Reply-To: <CAJTo0LaeVp=h34O9=RFU2mR54NhBsEH1fMyq=kgJHt21EPm1jA@mail.gmail.com>
X-Originating-IP: [128.224.162.204]
Subject: Re: [PATCH V3 1/1] dbus: Update to 1.8.2 version
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
X-List-Received-Date: Tue, 13 May 2014 01:40:01 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 05/12/2014 06:48 PM, Burton, Ross wrote:
> On 12 May 2014 10:50, Chong Lu <Chong.Lu@windriver.com> wrote:
>> Upgrade dbus to 1.8.2.
>> Change install-ptest rules.
>> Remove unneeded patches since it's included in new version.
>> Remove unrecognized option: "--with-xml"
> This should go to the oe-core list instead of oe-devel.
>
> What testing has been done with 1.8.2?  Have you tested that the
> system and user buses are operation both with sysvinit and systemd?
>
> Ross
Thank you for reply me.
I tested dbus with sysvinit not systemd.
I will test it with systemd and resend patch in oe-core.

Best Regards
Chong

