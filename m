Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1QCVnR-0003EL-VO
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 13:42:14 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with SMTP id p3KBRZGU010282
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 20 Apr 2011 13:27:36 +0200
Received: by ensc-virt.intern.sigma-chemnitz.de (sSMTP sendmail emulation);
	Wed, 20 Apr 2011 13:27:35 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Paul Menzel <paulepanter@users.sourceforge.net>
References: <1302996215.3122.31.camel@utx.lan>
	<4DAD6D9B.2000909@opendreambox.org>
	<1303297156.3979.46.camel@mattotaupa>
Date: Wed, 20 Apr 2011 13:27:35 +0200
In-Reply-To: <1303297156.3979.46.camel@mattotaupa> (Paul Menzel's message of
	"Wed, 20 Apr 2011 12:59:16 +0200")
Message-ID: <lysjtdnowo.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.2 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: -1.3
X-Spam-Level: -
X-Spam-Tests: AWL,BAYES_00,SPF_NEUTRAL,T_RP_MATCHES_RCVD
X-Scanned-By: MIMEDefang 2.71 on 62.153.82.30
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/5] binconfig.bbclass: search configs in D instead of S
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
X-List-Received-Date: Wed, 20 Apr 2011 11:42:14 -0000
Content-Type: text/plain; charset=us-ascii

Paul Menzel <paulepanter@users.sourceforge.net> writes:

>> > Searching for binconfig in S makes more problems than it
>> > brings benefits. Searching in the installed root seems to be more logical.
> ...
> I am adding Enrico to the CC since he did a lot of Ncurses work and
> maybe can also share his opinion.

yes; I submitted a similar patch [1] because it is required by ncurses.

Acked-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>



Enrico

Footnotes: 
[1]  http://patchwork.openembedded.org/patch/2248


