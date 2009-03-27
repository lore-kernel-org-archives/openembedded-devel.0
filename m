Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elena.valhalla@gmail.com>) id 1Ln9uz-0006Sp-7N
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Mar 2009 12:08:09 +0100
Received: by bwz19 with SMTP id 19so912163bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Mar 2009 04:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=eUnDh83icVocFEtHHp1pr/JRlxnmNZXN000uq+zvWl0=;
	b=bgUrcpEaj5vPiggJqoStOtwHSZdTpmwqklGl0tPWYUCp+DY8+rPeL+bFL8HqFgQjtK
	ly0S70LFb5OAP4eUIhpSkmstoey2Di2f1lzxvYx7S847nfMnEXcwBaxv8bd6AVQfcEu2
	+suUY4QckJBfrdgRGZFQs/4OX0hcK9pCac2CY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=r2kMduI8BMTbLa+SzwVCbIpHCK686/JnTp5MIP1UKMZRl4uwWR8u4FiF8j0rbG9R7n
	68l8AIR4aR+MLhNjDpOa5FBcuNfnEvFKCI0wAEM/5IVp8kBA70oOKT8Qv4+Rvn13+WHw
	aQhkUPq9Xr7n8Zi0Tc7S1OTpZxFzl3Fttof64=
MIME-Version: 1.0
Received: by 10.223.110.11 with SMTP id l11mr1516598fap.50.1238151980452; Fri, 
	27 Mar 2009 04:06:20 -0700 (PDT)
In-Reply-To: <gqiaef$dms$1@ger.gmane.org>
References: <5c5e5c350903270322o7d0ded99k3a050586bfcef19a@mail.gmail.com>
	<gqiaef$dms$1@ger.gmane.org>
Date: Fri, 27 Mar 2009 12:06:20 +0100
Message-ID: <5c5e5c350903270406u79e73e71hb8092bd4e71d088d@mail.gmail.com>
From: Elena of Valhalla <elena.valhalla@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: xmms-tremor source file is no longer available
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
X-List-Received-Date: Fri, 27 Mar 2009 11:08:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Fri, Mar 27, 2009 at 11:40 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> On 27-03-09 11:22, Elena of Valhalla wrote:
>> The package xmms-tremor fails in the do_fetch stage because it can't
>> find the source tarball, is there a mirror anywhere?
> Why isn't it fetching it from the angstrom source mirror?

probably because of a proxy misconfiguration on my side, I'll check that, thanks

-- 
Elena ``of Valhalla''

email: elena.valhalla@gmail.com


