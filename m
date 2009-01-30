Received: from [209.85.219.10] (helo=mail-ew0-f10.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1LSt3e-0005C0-1O
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jan 2009 14:05:18 +0100
Received: by ewy3 with SMTP id 3so478891ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jan 2009 04:57:30 -0800 (PST)
Received: by 10.210.34.19 with SMTP id h19mr1301064ebh.199.1233320250365;
	Fri, 30 Jan 2009 04:57:30 -0800 (PST)
Received: from ?192.168.1.10? (94-193-93-235.zone7.bethere.co.uk
	[94.193.93.235])
	by mx.google.com with ESMTPS id i7sm2264766nfh.13.2009.01.30.04.57.29
	(version=SSLv3 cipher=RC4-MD5); Fri, 30 Jan 2009 04:57:29 -0800 (PST)
Message-ID: <4982F938.3050000@xora.org.uk>
Date: Fri, 30 Jan 2009 12:57:28 +0000
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1233319034.13141.2.camel@EPBYMINW0568>
In-Reply-To: <1233319034.13141.2.camel@EPBYMINW0568>
X-Enigmail-Version: 0.95.0
Subject: Re: [PATCH] Automate uboot entry/load addresses detection.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Jan 2009 13:05:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Ihar Hrachyshka wrote:
> Automated UBOOT_LOADADDRESS and UBOOT_ENTRYPOINT variables detection (no
> need to specify them for every machine and/or kernel now).
>
>   
Looks like a nice patch! I think this should probably go it.

Graeme



