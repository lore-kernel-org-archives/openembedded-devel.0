Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1OpjXa-00056Z-Qa
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 17:11:27 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id o7TFAlkQ005803
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 29 Aug 2010 17:10:48 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.72) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1OpjWx-0002mA-3m; Sun, 29 Aug 2010 17:10:47 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
References: <1282924252-22046-1-git-send-email-chase.maupin@ti.com>
Date: Sun, 29 Aug 2010 17:10:47 +0200
In-Reply-To: <1282924252-22046-1-git-send-email-chase.maupin@ti.com> (Chase
	Maupin's message of "Fri, 27 Aug 2010 10:50:52 -0500")
Message-ID: <lytymdmp3c.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.2 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Scanned-By: MIMEDefang 2.68 on 62.153.82.30
X-SA-Exim-Connect-IP: 62.153.82.30
X-SA-Exim-Mail-From: enrico.scholz@sigma-chemnitz.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] jpeg_8b: Allow using older versions of automake
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
X-List-Received-Date: Sun, 29 Aug 2010 15:11:27 -0000
Content-Type: text/plain; charset=us-ascii

Chase Maupin <chasemaupin03@gmail.com> writes:

> * Added patch to allow using older versions of automake such
>   as 1.10.3 when building jpeg version 8b.
> * Only use the AM_SILENT_RULES if it is available.
>
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>

Acked-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>


> +    file://0001-configure-make-jpeg-work-with-older-autotools.patch;apply=yes \

I suggest to remove the explicit ';apply=yes'.



Enrico


