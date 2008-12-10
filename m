Received: from [209.85.198.250] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1LAXag-00048Y-Og
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Dec 2008 23:31:34 +0100
Received: by rv-out-0708.google.com with SMTP id f25so646694rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Dec 2008 14:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=j7F90i1sutRuPfZ9Igh4gOVWaydF51kEuXiT389qhZw=;
	b=Yh1dObzrJ6x5juGPS1QTjswNkznGlyQ2pNR4pnFMQpdgC8nQaKzQQ0+9FNkwWC3aS4
	xqpgzOmqchnH6+9+1B6ehD3oqK0ZK/J14v5yUZGi3FReWTuMniHBjp3FN6hRUmAjZzsN
	2apmQAm5HWFdP8jUv9lpfHVcIOHB9Qn+ynqBs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=acczDFX84rmgJMLrGyRJWPATvGBv5mFGLqiiKN60rNi+uM0NkzCpPJ+TvpK+PsC5Nv
	p4CrcE2LcYDje2rCQGtuB++0LfL6nsyR/R0dYbjeap7sEFyIhjbjMfvuVqsfoUjYejJk
	A8Dv+xzx21BRJJbQ4UmYewUKrNabjSpqNEEWE=
Received: by 10.140.165.21 with SMTP id n21mr564362rve.240.1228948051776;
	Wed, 10 Dec 2008 14:27:31 -0800 (PST)
Received: by 10.141.142.17 with HTTP; Wed, 10 Dec 2008 14:27:31 -0800 (PST)
Message-ID: <f96d234e0812101427r4afef700t6e8ea5ae77e71a40@mail.gmail.com>
Date: Wed, 10 Dec 2008 17:27:31 -0500
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1228945243.8200.16.camel@getafix>
MIME-Version: 1.0
References: <1228945243.8200.16.camel@getafix>
Subject: Re: Building minimal-image with kernel24
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
X-List-Received-Date: Wed, 10 Dec 2008 22:31:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Dec 10, 2008 at 4:40 PM, Joshua Lamorie <jpl@xiphos.ca> wrote:

> p.s. Where is it possible to contribute to the OE manual?

Check the following branch out of git, and then post patch to bugzilla.

http://git.openembedded.net/?p=openembedded.git;a=shortlog;h=refs/heads/org.openembedded.documentation

Thanks,
Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


