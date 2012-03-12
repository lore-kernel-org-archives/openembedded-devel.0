Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1S77eq-0002OR-95
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Mar 2012 16:59:36 +0100
Received: by ggcy3 with SMTP id y3so2680048ggc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Mar 2012 08:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=Se+29/K848ogG5fibvLIJylovBsdn/CYUAetxr8bXyU=;
	b=Xb6OSbmuOBxaDJ09s9E4pmUWoTNtxzh2qh04QStXIYjHG1hYex+CsJb9gezpgLcfPB
	mK5DT6Gw3MNz+ssZ8tjESJckwP8txuJqxyTsC9Wnosm3osJLJvmkt4pbzKJgoG/wIgUM
	aT15EVx++EIEaD/DADtZ//D7kNLee+K3EGEhezkoETGUCJkvRF6haj/e4W6YQVEwNy+g
	EZnD9JmQ9za6eJ/zjCH9IkFAdGflArdz2PRmYdPvEW2byFboDWLZr7DwGZEG89/4IwRh
	JF4qjyB4W+gQv6ZPIqmIXU+wCRkUsyzlQU0fyvXCHdI26IyYOybDTpgHNc5Pf8ArWSE/
	ImoA==
MIME-Version: 1.0
Received: by 10.60.25.65 with SMTP id a1mr8905312oeg.23.1331567452686; Mon, 12
	Mar 2012 08:50:52 -0700 (PDT)
Received: by 10.60.23.169 with HTTP; Mon, 12 Mar 2012 08:50:52 -0700 (PDT)
Date: Mon, 12 Mar 2012 10:50:52 -0500
Message-ID: <CAOd_LFz=vdziR_t_fKR=139=b=vzBgK4hyWxytXS+e0xf7ZTRQ@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: login problem
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
X-List-Received-Date: Mon, 12 Mar 2012 15:59:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

I have a customer who would prefer to use sysvinit (over systemd), so
I'm trying various non-systemd images.  core-image-minimal built with
recent oe-core, meta-oe, and meta-angstrom is giving me the following
when I try to log in:

beagleboard login: root
login: no valid shadow password

Wondering if anyone else has tried this recently, and should it work?
Are we still trying to keep sysvinit images working in Angstrom?

Thanks,
Cliff

-- 
=================
http://bec-systems.com


