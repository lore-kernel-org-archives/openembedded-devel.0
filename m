Received: from [74.125.44.156] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1M6cAw-0006rJ-99
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 May 2009 05:09:04 +0200
Received: by yx-out-1718.google.com with SMTP id 36so122824yxh.42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 May 2009 20:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=T3ox3J17GmuarM5I0+IesZwuQGtbAQSJisFHxWzpUYQ=;
	b=lw2pASp0OLIwvZ9Ie3SX0baNaYiuTE9dMr0IHG68htXafwKi2X7uE5yl+pROUDj7XR
	crCtWipHo7Yrx6n5Ed9t51WMp/LFwz6I2Z920mdNv3//rOih5ItMnd/19RRHfgcxKAye
	9KTHcnBhnTMdZuGG3wKfoiNHFWiLvBnixJRUE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=uCQ2nglKUlxDx/sxuAwYKxxYgFVRwiJQDdp6K7EEs7x543eRDtRrvbrp8pRrRJBTee
	QP5ccE8Nbx/A8ifT2vSlTXYz/1iMBRT4t6kLou9Eaf2fOItf+3gh12iFx0axLCCbWTLm
	vgGwM/ubfOrUhtskhVS12YhfMMDtUuCeNyYBE=
MIME-Version: 1.0
Received: by 10.151.74.11 with SMTP id b11mr61439ybl.151.1242788453070; Tue, 
	19 May 2009 20:00:53 -0700 (PDT)
Date: Tue, 19 May 2009 23:00:53 -0400
Message-ID: <f96d234e0905192000u56f4dfa7m2f9f4d38ee8a2107@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: reminder git move to OSUOSL Wed (PLEASE READ)
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
X-List-Received-Date: Wed, 20 May 2009 03:09:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

As announced last week, baring no major problems, we plan to move the
git service to OSUOSL Wed, 2009-05-20 @ 1900 UTC (3PM EDT).  The new
server can be tested/accessed at:

http://new.openembedded.org/cgit/
git://new.openembedded.org/openembedded
git@new.openembedded.org/openembedded

The server will likely be off-line for up to 2 hours while changes are
made and DNS entries propagate.

The original URIs will take effect then on the new server:

http://cgit.openembedded.org/
git://git.openembedded.org/openembedded
git@git.openembedded.org/openembedded

Note, the .net versions may or may not follow depending on Mickey.  At
any rate, the TTL for the .net entries are 24 hours, so it will take
some time for them to catch up if they are changed.

Please use the *.org URI's going forward.  The wiki and documentation
have already been modified to reference the *.org URIs.

Thanks,
Cliff


