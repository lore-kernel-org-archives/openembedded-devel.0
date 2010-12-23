Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1PVshQ-0001V7-M1
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Dec 2010 22:27:48 +0100
Received: by wyb40 with SMTP id 40so6658179wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Dec 2010 13:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=cvDS6qow+o1FUyBQlaIAVeK0QHK+zZK8KhC2WPYHR2A=;
	b=l0rbyAZEDdUfMZnnbFqgvPbEu5wQ8uTvaisxCb7hWmfpd3qqZVgvkvL5HAGN3yyO+y
	r++Xw63DfME6zYSsvNz9BUZ3H+Qx0jELvktkj7y4UtcT6YkiGbMr6jamXEZqI87dOiS9
	465RmlgTeVNyqb5dpBZ/6QYrYn+bfOpK2CUlc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=iHjRl24k6OnjpwgDMkWpqxTugEy3Kk+luNRjO5zzFSet8Hx/+fEswmtzIINdeyYuGx
	6M+o8KJXXFAlwrFUpvZ8NFsTDBbZqKjOFVCWP4t1tDBgxBpkc3a4mlJkM55JdRoH2NZH
	xN0IRyFH0tgfa7BvyJoeypODuF/0Uu5dbEsYg=
Received: by 10.216.154.8 with SMTP id g8mr6271705wek.12.1293139659557; Thu,
	23 Dec 2010 13:27:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.216.67.67 with HTTP; Thu, 23 Dec 2010 13:27:19 -0800 (PST)
From: Chris Larson <kergoth@gmail.com>
Date: Thu, 23 Dec 2010 14:27:19 -0700
Message-ID: <AANLkTikOz+v8orfKg_F=od4UWxmb7q4OWuU-r43FDKzQ@mail.gmail.com>
To: bitbake-dev <bitbake-dev@lists.berlios.de>, 
	Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Subject: [ANNOUNCE] BitBake 1.10.2
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
X-List-Received-Date: Thu, 23 Dec 2010 21:27:48 -0000
Content-Type: text/plain; charset=UTF-8

Greetings all,

There is a new 1.10 bugfix release available: 1.10.2.
As usual, there is a tag in the git repository, as well as
pristine-tar metadata.  The tarball isn't on berlios yet, but will be.

Changes in Bitbake 1.10.2:
       - Fix GraphViz .dot output for rdepends and rrecs
       - cooker: fix UnboundLocalError
       - lib/bb/fetch/hg: fix fetching from a mercurial repository

Thanks,
-- 
Christopher Larson
clarson at kergoth dot com
Senior Software Engineer, Mentor Graphics


