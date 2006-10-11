Received: from [64.233.162.196] (helo=nz-out-0102.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <nicolasfr@gmail.com>) id 1GXily-0001Wy-Ka
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Oct 2006 20:25:42 +0200
Received: by nz-out-0102.google.com with SMTP id m22so120297nzf
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Oct 2006 11:19:24 -0700 (PDT)
Received: by 10.64.10.2 with SMTP id 2mr1156555qbj;
	Wed, 11 Oct 2006 11:19:24 -0700 (PDT)
Received: by 10.65.197.7 with HTTP; Wed, 11 Oct 2006 11:19:24 -0700 (PDT)
Message-ID: <b9481e140610111119k67518836w8fadd4d81ce281a2@mail.gmail.com>
Date: Wed, 11 Oct 2006 20:19:24 +0200
From: "Nicolas FR" <nicolasfr@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: Push back wpa-supplicant_0.4.8.bb from oz354x to .dev
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Oct 2006 18:25:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

oz354x branch has a bb recipe for  wpa-supplicant_0.4.8 with a nice
startup script to launch wpa_supplicant on ifup (thanks hrw!).

I guess that should be pushed back in .dev.

Regards,
Nicolas.


