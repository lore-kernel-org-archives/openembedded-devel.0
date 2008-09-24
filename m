Received: from [209.85.198.248] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1KiHww-0005hm-7Z
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Sep 2008 02:09:46 +0200
Received: by rv-out-0708.google.com with SMTP id f25so3075148rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Sep 2008 17:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=4ZjZ5ja2QMdoxBpFk8zfoljsqwzDRqsyc3X9CxF2cCM=;
	b=j6E4ftIx2Woq0v1ALxwyfqtvBAXPI3PkPtmSjyRYcnan+audyM1C2Xh5QMN4pSziuQ
	4sb9nfQG3x1bS9Q3lTbxwlGXkeGKC7EByp+iwUof4pOVgaaLsgXiY8BnAEiSaZWQ2Wzj
	2HT0WGnjlfp4fFi3M1yYhBYL6Yrvlkm3oakfE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=EQwWAQAl6zpBoR2XKGtcYYpNl+J5YxHOok7Qp5dDYV+JI+MrwP9Aryl9bmlHieaV+p
	K+zef4rI5a5WhTPrmwdT3K2Vc6ZCYpqlOuTn6qvPMBff3FmOb0cKbRpQ6wzw4ng3RM+p
	aspWMQEwGD8Llhh6B6p+uMIAKfgkZ1H9sEpb4=
Received: by 10.140.188.10 with SMTP id l10mr3098506rvf.6.1222214770829;
	Tue, 23 Sep 2008 17:06:10 -0700 (PDT)
Received: by 10.140.174.2 with HTTP; Tue, 23 Sep 2008 17:06:10 -0700 (PDT)
Message-ID: <19c1b8a90809231706t75098d92pcd49608d6eee9b1e@mail.gmail.com>
Date: Tue, 23 Sep 2008 17:06:10 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <d1b08f940809231433j6063c230wbd805140f40b69e@mail.gmail.com>
MIME-Version: 1.0
References: <20080923211433.GA29169@denix.org> <gbbmll$t6i$1@ger.gmane.org>
	<d1b08f940809231433j6063c230wbd805140f40b69e@mail.gmail.com>
Subject: Re: libxml2_native_python_dir
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
X-List-Received-Date: Wed, 24 Sep 2008 00:09:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Sep 23, 2008 at 2:33 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
> talking with zecke I could easily develop a patch:
>
> http://www.pastebin.ca/1209737
>
> Seems to work here.Please test.

seems good. Bump up the PR numbers when you commit.

>
> Andrea
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


