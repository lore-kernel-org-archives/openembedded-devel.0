Received: from [66.249.92.171] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <slapinid@gmail.com>) id 1HzwQJ-0002V2-NY
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jun 2007 17:12:20 +0200
Received: by ug-out-1314.google.com with SMTP id i24so415546ugd
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jun 2007 08:08:46 -0700 (PDT)
Received: by 10.78.171.20 with SMTP id t20mr1930668hue.1182092926433;
	Sun, 17 Jun 2007 08:08:46 -0700 (PDT)
Received: from ?10.0.0.102? ( [85.249.166.143])
	by mx.google.com with ESMTP id 35sm11859640nfu.2007.06.17.08.08.44
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 17 Jun 2007 08:08:45 -0700 (PDT)
Message-ID: <46754E7B.2070809@gmail.com>
Date: Sun, 17 Jun 2007 19:08:43 +0400
From: Sergey Lapin <slapinid@gmail.com>
User-Agent: Icedove 1.5.0.10 (X11/20070329)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: IMAGE_LINGUAS with Angstrom
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Jun 2007 15:12:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

hi, all
When building angstrom-x11-image, IMAGE_LINGUAS seems
to have no effect - any ideas?
More than that, forcing that in image.bbclass sets
up only base locale, but no package locales...
Is there any way to build localized image of
Angstrom (angstrom-x11-image)?
I just don't want to install all package locales
by hand, so interested in ways to do that automagically.

Thanks a lot,
S.


