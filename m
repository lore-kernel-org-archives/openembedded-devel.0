Received: from [209.85.198.246] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1KsNli-0001U6-Tx
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Oct 2008 22:23:55 +0200
Received: by rv-out-0708.google.com with SMTP id f25so3016643rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Oct 2008 13:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=ejGaBL8VdOTlvbmTLDUslHCT5kqpdHW+YrpIsjkLjaU=;
	b=DfeJCFmtoce3GoDzGmuwzZ9WijL9pRTbgdYyrgw+RiNpiu9qfp5j/+YVciik0sOfPU
	aSvCDmTedsk5PP2RNOMq7nErR85zUICzteRwdnYRd5Sl4fsIwK8P7XXeW8eOJd2IHJVq
	1ewndsQYo3fGJKeLFW8lWVgSOY828W3VCRM9Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=rNZChC5PYEJFrwU+bWtGDb/iUTh5IZU8d+rloK2/QFrP9wgo7AZYIOOMHi0ffjJbyB
	g/pd1CHEyiMPFK+GxIuhEZbUu/brXWXdhh6ph3dyXbBs8AVCprLrNuh7cwnTMWnd/gP/
	fBgvxaVxD0tiIUh1u8Eu1ttGYiS3kVwkhK6Yo=
Received: by 10.141.177.10 with SMTP id e10mr5922485rvp.72.1224620610480;
	Tue, 21 Oct 2008 13:23:30 -0700 (PDT)
Received: by 10.140.204.10 with HTTP; Tue, 21 Oct 2008 13:23:30 -0700 (PDT)
Message-ID: <d2b9ea600810211323y1dd1fc11i585f26f044696de9@mail.gmail.com>
Date: Tue, 21 Oct 2008 22:23:30 +0200
From: "Esben Haabendal" <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1223383906-4111-1-git-send-email-eha@doredevelopment.dk>
MIME-Version: 1.0
References: <> <1223383906-4111-1-git-send-email-eha@doredevelopment.dk>
Subject: Re: Canadian SDK support
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
X-List-Received-Date: Tue, 21 Oct 2008 20:23:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

I have rebased the canadian-sdk branch at

http://git.doredevelopment.dk/openembedded.git
git://git.doredevelopment.dk/openembedded.git

against the new org.openembedded.dev git repo.

Best regards,
Esben
--=20
Esben Haabendal, Senior Software Consultant
Dor=E9Development ApS, Ved Stranden 1, 9560 Hadsund, DK-Denmark
Phone: +45 51 92 53 93, E-mail: eha@doredevelopment.dk
WWW: http://www.doredevelopment.dk


