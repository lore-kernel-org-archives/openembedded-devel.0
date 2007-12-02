Received: from [64.233.166.177] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <sakoman@gmail.com>) id 1IyqSA-0007Y8-6t
	for openembedded-devel@openembedded.org; Sun, 02 Dec 2007 16:09:54 +0100
Received: by py-out-1112.google.com with SMTP id a29so7148935pyi
	for <openembedded-devel@openembedded.org>;
	Sun, 02 Dec 2007 07:06:33 -0800 (PST)
Received: by 10.35.98.3 with SMTP id a3mr2390830pym.1196607993549;
	Sun, 02 Dec 2007 07:06:33 -0800 (PST)
Received: by 10.35.52.10 with HTTP; Sun, 2 Dec 2007 07:06:33 -0800 (PST)
Message-ID: <5e088bd90712020706x4dae63d5p6417a2ed82e23a72@mail.gmail.com>
Date: Sun, 2 Dec 2007 07:06:33 -0800
From: "Steve Sakoman" <sakoman@gmail.com>
To: openembedded-devel@openembedded.org
MIME-Version: 1.0
Subject: gtk+-directfb
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
X-List-Received-Date: Sun, 02 Dec 2007 15:09:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I have an interest in building gtk+-directfb for the gumstix platform.

So, of course, I gave it a quick try and it failed because of a
dependency on pango-directfb -- which doesn't exist.

In checking some of the prior traffic on the list, I see that
pango-directfb has been removed due to its causing build breakage.

Has anyone come us with an acceptable approach to supporting a
gtk+-directfb build since then?

Steve


