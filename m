Received: from mail-pz0-f185.google.com ([209.85.222.185])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1NUSxd-0005V1-4E
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jan 2010 23:42:12 +0100
Received: by pzk15 with SMTP id 15so13578315pzk.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2010 14:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=6N9WmG0/5OKOLzB4Zx8/57tEfrOwqJtRwGgIMdY4OQA=;
	b=IcyO02fYOmh+lHXdg24eOoU8hJu5MT/C7MRXSTEv1j4EOtBNIf2fXfuDwCu6rxLnql
	wg4l/oem6Gwz6vn6JVFq5QWPyPx/SpiFGWtQHG1DEspLt/qcwGnLumxEeBpyMeJrz7gi
	H7qy9/6tfXKysg7w8U5QZ34dEW/Uu85LT2QC4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=C9k18RcPIqGWTZnR2DAnzvosQzSPd22Dwb96CIrdAQbsrvvOZ3Iu0yhTUfC7AeFx55
	PssK7w2KCdOybDJq/iVjVLzHBnMoUbyavlAoHC8Fdcz86/hcPdjxLx4+ZgOJ04oioIMR
	eD45UOUyQnnoTYXgXcz2Y02CVzF28fQt8qa8A=
MIME-Version: 1.0
Received: by 10.142.56.6 with SMTP id e6mr4812539wfa.158.1263249599608; Mon, 
	11 Jan 2010 14:39:59 -0800 (PST)
In-Reply-To: <alpine.LFD.2.00.1001111718250.2601@localhost>
References: <alpine.LFD.2.00.1001110722550.22930@localhost>
	<4B4B2B0E.8030501@balister.org>
	<alpine.LFD.2.00.1001110856460.28813@localhost>
	<4B4B3301.2090808@balister.org>
	<6ec4247d1001111337x5a5572a2l74d23bf1bfa03a68@mail.gmail.com>
	<alpine.LFD.2.00.1001111718250.2601@localhost>
Date: Tue, 12 Jan 2010 09:09:59 +1030
Message-ID: <6ec4247d1001111439m43a8147bk8a614a253563999c@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.185
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: bitbake and e2fsprogs-1.41.9?
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
X-List-Received-Date: Mon, 11 Jan 2010 22:42:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

I'll send a patch later today.

-Graham


