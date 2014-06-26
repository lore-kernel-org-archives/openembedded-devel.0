Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id BD73E601A0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jun 2014 19:28:24 +0000 (UTC)
Received: (qmail 16683 invoked by uid 1003); 26 Jun 2014 19:28:24 -0000
Received: from unknown (HELO ?10.16.32.86?) (philip@opensdr.com@64.186.172.226)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	26 Jun 2014 19:28:24 -0000
Message-ID: <53AC7457.3030103@balister.org>
Date: Thu, 26 Jun 2014 12:28:23 -0700
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <53AA0672.7070606@balister.org>	<2894594.Bns9GHPWX5@peggleto-mobl5.ger.corp.intel.com>	<53AB1718.7000608@balister.org>
	<20140625185504.GD1580@denix.org>	<CAMCfZKEOYwA=9CtEVVccXASOJXHsh5agvPWvG6imOJXXCEv8Zw@mail.gmail.com>	<53AB5ADB.3080403@balister.org>	<CAMCfZKHUaFwx_pQdgqbeS1C-WmKM9DEcNfixug9Jw8Z645epuQ@mail.gmail.com>	<20140626180954.GG1580@denix.org>
	<CAK8F28kHj_JJh84XWcVt7wy2p70BvpV+WCF4n2r1=FWrRQT8cQ@mail.gmail.com>
In-Reply-To: <CAK8F28kHj_JJh84XWcVt7wy2p70BvpV+WCF4n2r1=FWrRQT8cQ@mail.gmail.com>
X-Enigmail-Version: 1.6
Subject: Re: State of the art for creating an image that you can dd to an SD card
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
X-List-Received-Date: Thu, 26 Jun 2014 19:28:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 06/26/2014 12:23 PM, Ash Charles wrote:
> On Thu, Jun 26, 2014 at 11:09 AM, Denys Dmytriyenko <denis@denix.org> wrote:
>> "CHS business", as Philip called it, was only partially required in the early
>> days of OMAP3 SoCs few years ago, due to some "specific" FAT implementation of
>> the BootROM. These days it's not required on modern Sitara SoCs.
> Which OMAP3 SOCs need the CHS business?

Ones with a really ancient MLO, I think. Hopefully, all of those
binaries are gone from the Internet now.

Philip

> 
> --Ash
> 

