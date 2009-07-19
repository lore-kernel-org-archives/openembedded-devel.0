Received: from [209.85.198.241] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MSfdk-0004MZ-5J
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Jul 2009 01:17:56 +0200
Received: by rv-out-0708.google.com with SMTP id l33so479983rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jul 2009 16:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=/5/zDi6IOF9G4qtNudMI984Slgg/fDUvqVFGt9bmW5o=;
	b=FNB9Bz04y+Fp0Sp6DOnQ+XkXrBDOEQ+6yHdDxcntOYJhudhYfp8D3Nn8gd4QU4FiPg
	FM/c7muT/1AGQ79nUSnQ/HdReAcFbNHUUdf2UUSNp8a+iKhTxAmdRwXDEByFMWkLgGmP
	6NMErc90lojKZdI9bqJCmTMl8/PXBv8jl4jAk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=hjYEYuY9qSzzXHlsLgYUQMcJ1YOhTnAsfheiLDL516eRfyiiK0YCNJgFduOA/5c5hE
	ZJAHYIoavM1NM1exG8COcNfrbATy9h3LqMuG3MChiG2I1MWblsrp2NONrsRfTsuTtriD
	FKfIwPVyY6qJN3ZOJvFQfDtCvTawSRhaU0qkc=
Received: by 10.140.193.15 with SMTP id q15mr1829257rvf.62.1248044643419;
	Sun, 19 Jul 2009 16:04:03 -0700 (PDT)
Received: from gmail.com (adsl-71-146-11-93.dsl.pltn13.sbcglobal.net
	[71.146.11.93])
	by mx.google.com with ESMTPS id k41sm18924341rvb.7.2009.07.19.16.04.01
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 19 Jul 2009 16:04:02 -0700 (PDT)
Date: Sun, 19 Jul 2009 16:03:58 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090719230358.GB15568@gmail.com>
References: <1248042838-7496-1-git-send-email-otavio@ossystems.com.br>
	<1248042838-7496-2-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1248042838-7496-2-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.18 (2008-05-17)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH 2/3] uClibc: use __always_inline instead of	__inline__
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
X-List-Received-Date: Sun, 19 Jul 2009 23:17:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (19/07/09 19:33), Otavio Salvador wrote:
> From: Mario Domenech Goulart <mario@ossystems.com.br>
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Acked-by: Khem Raj <raj.khem@gmail.com>
provided you take care of PR bump 

Thx

-Khem


