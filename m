Received: from [66.249.82.225] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JuUSD-00015r-Mj
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 May 2008 17:24:13 +0200
Received: by wx-out-0506.google.com with SMTP id i29so1104708wxd.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 May 2008 08:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=4bEdW66ZZUAwbt8lOiiZkZlpbzshGEUnVv1APTSlGEQ=;
	b=qlQp3uuq1Imfks+Sz2kpIniTbqV1siGLlcdvMzSI3myGAoGciE/tgp0vz8EKe54Ar1Ubd6OGidbNQlhiidmsGCnrrN7BK4a3wv4esZTYypl09iWRNRdenZ6quld83D6bEx4WJKcDnq3YgAqr1xuMCrEQDRSgPK4TxTVDogD70do=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=FR4R1pQU+ea2KtpDIbASPlDOcWCFRnVkff7rm6JbIkbwhQXIW2P3hJ2CrZnuhG+s4xqQaV1pz4UP9XxdrbXfh96B3okYxc6HCjdXR4vc9Y/dh7AR41xUgx3wvMuGi4UZzafvl/K4yyhkLo4asI3xNIXG13GEuPaJvtB9gPV9cIQ=
Received: by 10.100.120.6 with SMTP id s6mr5888330anc.72.1210346602907;
	Fri, 09 May 2008 08:23:22 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Fri, 9 May 2008 08:23:22 -0700 (PDT)
Message-ID: <c384c5ea0805090823p6531cf7cuc02a25c5684ef911@mail.gmail.com>
Date: Fri, 9 May 2008 17:23:22 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <48246A67.4030800@balister.org>
MIME-Version: 1.0
References: <48246A67.4030800@balister.org>
Subject: Re: Change ANGSTROM_EXTRA_INSTALL to IMAGE_EXTRA_INSTALL
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
X-List-Received-Date: Fri, 09 May 2008 15:24:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Philip,

On Fri, May 9, 2008 at 5:14 PM, Philip Balister <philip@balister.org> wrote:
> I'd like to change the variable used for the user to add packages to a
> standard image from ANGSTROM_EXTRA_INSTALL to IMAGE_EXTRA_INSTALL. This is
> an image property, and not Angstrom specific.
>
> Is there anything wrong with this idea?
>
No, except I guess you ask the Angstrom guys'n'gals as well?

Regards,
-- 
Leon


