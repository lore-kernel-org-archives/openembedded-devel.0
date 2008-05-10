Received: from [209.85.132.249] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JuqWm-0007CL-2k
	for openembedded-devel@lists.openembedded.org;
	Sat, 10 May 2008 16:58:24 +0200
Received: by an-out-0708.google.com with SMTP id b38so348584ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 May 2008 07:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=9darHjdPbpguMJAHkdeMqXks99owkUHDjQsF+G40mAo=;
	b=fj37fWkRx8W7ey/MBPUYMj1W/cd+9aciMmftZ3ayG3JYUdq2ZIFuw9v2jH1QgSzPz2osPcZ5hVi5bkxgCpBSh7znnQB3pIKwESeybnZwToRdyGpL+qpCfr50exVR55wM4UAEkA7rD1H8DrCp1dDIWE33+UqaKqZZHCzFpM0rYRo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=YP05nE7WbiUTFBYznHb08vvaFt55zrPmTZos+Y2iXPa1l63iPs1bV4kx2PGv/UKtRK5UKbygTJx6yz/niDyT8T7BVqoZ6JIdinppJOPN3VQOyFSPJ9UM1xTm+tD+Vhjf+77552ieKjadLN5LA5xYbsDvUq73kfN4DWzL38MOAsE=
Received: by 10.100.14.17 with SMTP id 17mr6963664ann.23.1210431444880;
	Sat, 10 May 2008 07:57:24 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Sat, 10 May 2008 07:57:24 -0700 (PDT)
Message-ID: <c384c5ea0805100757k6f1133fcka652b4d8c6251e0b@mail.gmail.com>
Date: Sat, 10 May 2008 16:57:24 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <g049dg$2ks$1@ger.gmane.org>
MIME-Version: 1.0
References: <g049dg$2ks$1@ger.gmane.org>
Subject: Re: RFC: reverse the name change for org.oe.stable
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Sat, 10 May 2008 14:58:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Rolf,

On Sat, May 10, 2008 at 3:53 PM, Rolf Leggewie
<no2spam@nospam.arcornews.de> wrote:

> I am concerned about the loss of reputation that OE is incurring because
> the .stable guys are willfully ignoring the official bug tracker.  I
> think it should be renamed back to angstrom$whateveritwasbefore.  We
> can't seriously be telling guys all the time "report your problems to
> the BTS" and then have the "official" stable branch completely and
> willfully ignore it.  I'd go as far as requesting it should be denied
> the org.openembedded.* namespace in monotone.
>



-- 
Leon


