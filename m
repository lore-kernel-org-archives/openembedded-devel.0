Received: from [72.14.220.156] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay4mail@gmail.com>) id 1LNsHW-0002sV-M2
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Jan 2009 18:14:54 +0100
Received: by fg-out-1718.google.com with SMTP id l26so775573fgb.20
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jan 2009 09:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:message-id;
	bh=Ub5cs8yR4JIdWRQSjKIhVv2SvnZ5QbZXLAAv2PAYQh0=;
	b=UN8KcXKBy/fVEJDsGI6E6zBHC50XEEukBePnn+Qa8Y/iRQXNBMRSbdHbdOImmYwA43
	tLOrv4pgB1Fa/dgs8IH3q3pWR0dI6/HRdOqHxx2OOE35dV3SDdnXXOq2ncf4iTmtz7Te
	E0TFF2iExlRePbX9KWrPqhwRWbUNW6k5ibNJg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:references:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:message-id;
	b=VGsn2in1+vyyN6NhN3Lozn/59AlKCjNDmdx3QR1R30l8swe4z8lEfcoQCNJDziTrNP
	du3iFUYfT2iARiS9bUWHJ/LeEQ/z6TZuhr5dCQkvsxzdCR+zeQKkX2QrYUNoW+p3rQr9
	UVboUNiVz3KMiIAe4xtnE+mL6Q50xcA+zm4us=
Received: by 10.86.4.2 with SMTP id 2mr78523fgd.4.1232125690352;
	Fri, 16 Jan 2009 09:08:10 -0800 (PST)
Received: from is.home (93-81-71-14.broadband.corbina.ru [93.81.71.14])
	by mx.google.com with ESMTPS id 4sm1466640fgg.44.2009.01.16.09.08.08
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 16 Jan 2009 09:08:09 -0800 (PST)
From: Yuri Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jan 2009 20:08:03 +0300
User-Agent: KMail/1.9.10
References: <d1b08f940901150928h56ede408u2d070606fbe6b7bc@mail.gmail.com>
	<d1b08f940901160534n2d204a36r43494e1a6ed855c5@mail.gmail.com>
	<1232121627.4988.2795.camel@hammer.suse.cz>
In-Reply-To: <1232121627.4988.2795.camel@hammer.suse.cz>
MIME-Version: 1.0
Message-Id: <200901162008.03815.jay4mail@gmail.com>
Subject: Re: ARM bootloaders (Zaurus) and CMDLINE
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
X-List-Received-Date: Fri, 16 Jan 2009 17:14:54 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> Kernel 2.4 used a trick - user space utility called writerominfo read
> some of these values and sent them to kernel.

Stanislav, can you please explain this a bit more?

-- 
Yuri Bushmelev


