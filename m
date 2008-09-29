Received: from [209.85.198.244] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <felipe.contreras@gmail.com>) id 1KkPum-00074o-64
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Sep 2008 23:04:23 +0200
Received: by rv-out-0708.google.com with SMTP id f25so3087164rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Sep 2008 14:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=cKkM5cIW10QDH1czGSHv0zbq38I5bb3zpXAVAktTEqQ=;
	b=Ij4BAUsgyagv8FFu7kg5fVtBCVwXsHApAjDZkUtAJYh+rBBeHOgxUoyI34couSo2Aa
	aGe9/0qeg+HiZVKc9R68EImpASvi1md5XOapJ0HhJU8W/qKOJWGuurlL1heq44Et0n7/
	uiDpIlTBgrGDueH4HahVEiLWapVXBBkAHPN+E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=hpVjEdj7RjOIBHIpTSevengKYP18MGtxbCSMPfLyxdDzZibj27pouYpuMEEyEy6J85
	fOtvTYyEvQ9oj+XNHUQrWDY8ucEWoFTz9yylYW2n/KLnmlJiFgappgXQzKNgDsnnaAba
	z1ixESTYcwztnAQkx8svprKJLN6nB7Sx1kqpc=
Received: by 10.141.172.6 with SMTP id z6mr2912507rvo.47.1222722018948;
	Mon, 29 Sep 2008 14:00:18 -0700 (PDT)
Received: by 10.140.166.19 with HTTP; Mon, 29 Sep 2008 14:00:18 -0700 (PDT)
Message-ID: <94a0d4530809291400g6b6df39cr3b74c109353fbdac@mail.gmail.com>
Date: Tue, 30 Sep 2008 00:00:18 +0300
From: "Felipe Contreras" <felipe.contreras@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200809272237.22810.zecke@selfish.org>
MIME-Version: 1.0
References: <200809272237.22810.zecke@selfish.org>
Subject: Re: git conversion and what is missing?
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
X-List-Received-Date: Mon, 29 Sep 2008 21:04:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sat, Sep 27, 2008 at 11:37 PM, Holger Freyther <zecke@selfish.org> wrote:
> Hey,
>
> I wonder what is missing until we finally switch to git? From my point of view
> it is:
>
>        - Finishing this table [1]
>        - Maybe fixing the script to get this one rev importer properly
>        - Run the conversation...

So there are no issues with the script?

-- 
Felipe Contreras


