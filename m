Received: from [209.85.220.167] (helo=mail-fx0-f167.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1LeTwQ-0003Xf-81
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Mar 2009 13:41:46 +0100
Received: by fxm11 with SMTP id 11so2352845fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Mar 2009 04:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Urak8BdxpaCerrEagRDq/Fgq0QOM3CaHUC3Lw9fWZHM=;
	b=Af1agDXlg8p9k0PgvyCB+p3iKj6JSgGCkKDH+yhpH9xaSpUQIL/7Cdv0nLbLE8a/1h
	hVhUPceDRderXIf3E2H6MYaucPAtkabNTual6AuOcYRftIoxrvRW5Y303HhU9xUX8dEe
	e4BkB4Uol8WD5+7Gnkt6wYsnKSqUeyUmgP6UU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=j7bhtg42JEXtlJrA1noyZcfEkHjnliIRLQ3XvmPgiMkOe4y/qC7swfjqP1F9pL3cgE
	efhlGBybAHjjebk0e+MR1a2Zp1WOtMDrsyjRJXsGSfS1/kYzWbLkwPCz5Stncvlkn8G/
	lDdD+ne8ttgDsaNtACpELHpIyKwKG9URaq+tA=
MIME-Version: 1.0
Received: by 10.223.106.200 with SMTP id y8mr3949574fao.24.1236083862047; Tue, 
	03 Mar 2009 04:37:42 -0800 (PST)
In-Reply-To: <20090303093030.GA17676@mi.fu-berlin.de>
References: <49AB1EB0.5090002@kernelconcepts.de>
	<20090303093030.GA17676@mi.fu-berlin.de>
Date: Tue, 3 Mar 2009 13:37:42 +0100
Message-ID: <d1b08f940903030437w1ad85019xfdd0685e97b9aafb@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Dependency tracking - or - how to get rid of kexec-tools
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
X-List-Received-Date: Tue, 03 Mar 2009 12:41:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

>Upgrade kexec-tools
+1

You could also try:

cd ../org.openembedded.dev/conf
grep -r  kexec .

My 2 cents

Andrea


