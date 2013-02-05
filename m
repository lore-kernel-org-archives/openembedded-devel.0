Received: from mail-oa0-f52.google.com ([209.85.219.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U2jlq-0007YA-WC
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Feb 2013 15:45:18 +0100
Received: by mail-oa0-f52.google.com with SMTP id k14so214676oag.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Feb 2013 06:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:date:x-google-sender-auth:message-id
	:subject:from:to:content-type;
	bh=BlarFlSKC+9ONf89VA1nuxTYPTaAWBI1HE+/epAwsZc=;
	b=Z9xJKRUUrgScV9VRdEi1EPiFMNR1P6Sy+H9d3fkV599L9ynFl1pjD9Ysd7ytNAaQiH
	v8KKZVk6hUsF4Hr+ncEFJEkOLZ4MYyZShc8AC3tpPqNgA0piQYqIPvOqJL7AcSoJXwXE
	memRTaPB5GXE5rAZc9M11LMC6GgV4LQLHR2cSj/P7EYmH77w2MEdbvVRJJO5QKXWSBq4
	cG5bX+Tdj1EO73ve3JDPR4mxz2BzaVI0uMmvT5h/cS/Oyj37MU73Do7QND/ZEYmz8IIR
	ILLcARKZSzaL6dC3P/qrJcsIcN8PjO+lzDZFvzC0tED+D4bre8KVMJivXrkO72x1XRS7
	8LFQ==
MIME-Version: 1.0
X-Received: by 10.60.8.40 with SMTP id o8mr18118879oea.112.1360074564867; Tue,
	05 Feb 2013 06:29:24 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Tue, 5 Feb 2013 06:29:24 -0800 (PST)
Date: Tue, 5 Feb 2013 12:29:24 -0200
X-Google-Sender-Auth: xo-Dofv01jxBaOfCoiFgfdu8Gc8
Message-ID: <CAP9ODKpr-Hg6h5mANx0s-p=TUzfaKhwmrKQMRK1wRpDdEHCXeA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	=?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Subject: [for-danny] Changes for cherry-pick
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
X-List-Received-Date: Tue, 05 Feb 2013 14:45:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Eric,

Please evaluate following changes for backport to danny (in order):

* 430922f xf86-video-geode: Update to 2.11.14

* 6956575 samba: split winbind into winbind and libwinbind

* 47e9480 samba: remove empty /sbin

* 1ec00cd samba: added gnu-configize for AArch64 support

* 86c8f45 samba: Fix build on Fedora 17

* a623fd9 samba: disable avahi and build without acl

* 18e5661 samba: add new package libwbclient to avoid libsmbclient
dragging in samba

Regards,

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


