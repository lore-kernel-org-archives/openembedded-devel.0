Received: from [209.85.198.251] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hvontres@gmail.com>) id 1LFFBE-0008Lo-6h
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Dec 2008 22:52:44 +0100
Received: by rv-out-0708.google.com with SMTP id f25so3057477rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Dec 2008 13:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=Ua2iGrxN87ePX8J0AyOZJxontmd66GfM0vDvSUe/PGI=;
	b=il+b0dTLtfdG5otuQo0yN3x+u3+vK2URjwk7su1PnC8V1a1MS6hxMHjJICWpkiJ3J2
	cWkgOmcGSuAG5DTAJhhJYs7b4QTFV0gCGmkxgXPTOZbyGKQyA29/+m6/1pJVRfE4OhS2
	5r3/Mz1CtQL69dbeZH4ua8upRRvppifDvYYPQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=vOOriDWNw5yEEjRKsqVvLz4a1h5kIauuO2LhPtQSk+MMg12/lLFVaEIHLVrm6ArI1g
	G+id4r9A3mGQnmRSX42CK68KykZcOT9DMNIylYwVVe5PxY8M/miTYXte6g+sfwl9Z0El
	Lc7KSEaroCCPlfgGemFeTK8xGZbbbdd1y674w=
Received: by 10.141.76.21 with SMTP id d21mr3947593rvl.34.1230068864513;
	Tue, 23 Dec 2008 13:47:44 -0800 (PST)
Received: by 10.141.132.3 with HTTP; Tue, 23 Dec 2008 13:47:44 -0800 (PST)
Message-ID: <a7f8874a0812231347u5d3344f8ue79b6b037e854494@mail.gmail.com>
Date: Tue, 23 Dec 2008 13:47:44 -0800
From: "Hans Henry von Tresckow" <hvontres@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200812161416.50581.zecke@selfish.org>
MIME-Version: 1.0
References: <a7f8874a0812072146m13e56d10hcbcfe5171d27389e@mail.gmail.com>
	<200812161416.50581.zecke@selfish.org>
Subject: Re: Indentation Error with latest bitbake (svn rev 1145)
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
X-List-Received-Date: Tue, 23 Dec 2008 21:52:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Dec 16, 2008 at 5:16 AM, Holger Freyther <zecke@selfish.org> wrote:
> On Monday 08 December 2008 06:46:57 Hans Henry von Tresckow wrote:
>> Has anybody seen this error yet:
>
> any news on this? ... and general hint. Posting random parts of a log is worse
> than not posting a log file. What you actually do when "composing" this is
> filtering out the information and just leave the noise. From a purely
> information theory point of view you make sure that only noise arrives at the
> other part of the channel.
>
> Post a complete log.

It seems my checkout was stuck on an old/incomplete version of the
.dev branch.  This output happened right after starting bitbake, so
that actually was the entire output at the time. Once I re-cloned the
repo, the error went away.
-- 
Henry von Tresckow (hvontres)
Margaret Mead  - "Always remember that you are absolutely unique. Just
like everyone else."


