Received: from [209.85.132.240] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <xjqian@gmail.com>) id 1JUbhQ-0005wG-UI
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Feb 2008 06:52:58 +0100
Received: by an-out-0708.google.com with SMTP id b33so776246ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2008 21:52:12 -0800 (PST)
Received: by 10.100.136.15 with SMTP id j15mr14396843and.80.1204177932491;
	Wed, 27 Feb 2008 21:52:12 -0800 (PST)
Received: from ?192.168.1.179? ( [71.16.230.132])
	by mx.google.com with ESMTPS id h7sm6204392wxd.10.2008.02.27.21.52.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 27 Feb 2008 21:52:11 -0800 (PST)
Message-ID: <47C64C08.3060700@gmail.com>
Date: Thu, 28 Feb 2008 00:52:08 -0500
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080110)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <47C3D204.9090908@dominion.kabel.utwente.nl>	<47C411C8.5030204@balister.org>
	<fq192i$nqe$1@ger.gmane.org>
In-Reply-To: <fq192i$nqe$1@ger.gmane.org>
X-SA-Exim-Connect-IP: 209.85.132.240
X-SA-Exim-Mail-From: xjqian@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: commit 9b9a2409c7e2ddb2caf0a5aba74549f65c52b503
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Feb 2008 05:52:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/26/2008 09:52 AM, Rolf Leggewie wrote:
> Philip Balister wrote:
>> And yes, I really should write a FAQ entry on this ....
> 
> You are lucky, I just did and committed it in
> 64b95f1878ea8c82433db9c21cef7267916c9113
> 
> I hope I did not write too much non-sense.  Please review
> http://www.openembedded.org/user-manual&dpage=commonuse_new_package once
> my changes are incorporated.

conf/sane-srcrevs.inc should be conf/distro/include/sane-srcrevs.inc

Regards
Gordon


