Received: from [209.85.198.246] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1KnCvc-00067b-UB
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Oct 2008 15:48:45 +0200
Received: by rv-out-0708.google.com with SMTP id f25so4937318rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Oct 2008 06:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=UKMrWpTxRLZ4CmzGNJvk8y/zdkS6rUqho/L4AcK0VyQ=;
	b=N7UwmWHk/8Vkb2jBpNGqDt6LblVckDVXrSEoPtLDvzhNfk3t1ZjwDw2nsAKhE3ckxd
	5X9ebLNn7hvgT9iuxxMO2sktZRFNncVv9/DZCcCENl3hNRmZIvfjXWwcj0yQ5Kucp45q
	xnTZlT4RvShrMHbiAgs6+DklVKu2/ME1P45X0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=mfyQGImNz4VqrFYD2bWVFIPuv9GRandAxzdw6vfcT/VevyJUVlgsaFA/Ed268tAkyG
	cHLXTtj/afOkN6rFlKeg52MhvolIeeS/8WFGQarJFpKsdSxvaCCuNw+y/Gj18PiNMj4k
	NtIW1Szn1z8psZSNHs5jD7sMKv0ob1J+Ax+X0=
Received: by 10.140.136.6 with SMTP id j6mr3863667rvd.231.1223387050037;
	Tue, 07 Oct 2008 06:44:10 -0700 (PDT)
Received: by 10.140.204.9 with HTTP; Tue, 7 Oct 2008 06:44:09 -0700 (PDT)
Message-ID: <d2b9ea600810070644n7e64574fs7db73a0f9b0cd1df@mail.gmail.com>
Date: Tue, 7 Oct 2008 15:44:09 +0200
From: "Esben Haabendal" <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20081007133502.GA19220@mi.fu-berlin.de>
MIME-Version: 1.0
References: <c50b431758852b327e53d4de9de43173d439b36a.1223383759.git.eha@doredevelopment.dk>
	<f2596b99780ea3954dc25884bf29704a5584c2f8.1223383759.git.eha@doredevelopment.dk>
	<20081007133502.GA19220@mi.fu-berlin.de>
Subject: Re: [PATCH 13/13] canadian-sdk.bb, task-sdk-canadian-host.bb
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
X-List-Received-Date: Tue, 07 Oct 2008 13:48:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Oct 7, 2008 at 3:35 PM, Henning Heinold
<heinold@inf.fu-berlin.de> wrote:
>
> thanks for the patches, but normaly we prefer to put the patches into the
> bugtracker and mentioned here the bug id.

Well, I would like to have a discussion on this patch series, and were
not suggesting to commit it as-is.

Also, as you might have noticed it, I am sending the patches as git
diff's, and not mtn diffs, so I assume
I would be ill fated If I were to put them in bugzilla.

Anyway, I just hope that someone will take a look at this work, so I
that I have a chance to move
canadian sdk in the right direction for putting it into .dev some day.

/Esben
--=20
Esben Haabendal, Senior Software Consultant
Dor=E9Development ApS, Ved Stranden 1, 9560 Hadsund, DK-Denmark
Phone: +45 51 92 53 93, E-mail: eha@doredevelopment.dk
WWW: http://www.doredevelopment.dk


