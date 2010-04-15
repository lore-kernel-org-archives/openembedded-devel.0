Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1O2Q4G-0003h1-4E
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Apr 2010 16:29:22 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.3/8.14.4) with ESMTP id o3FEPjKW007324
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 15 Apr 2010 16:25:45 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.71) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1O2Q0m-0004I2-Re; Thu, 15 Apr 2010 16:25:45 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: "Sebastian Spaeth" <Sebastian@SSpaeth.de>
References: <1271237902-6295-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<87k4s9kxcy.fsf@SSpaeth.de>
Date: Thu, 15 Apr 2010 16:25:44 +0200
In-Reply-To: <87k4s9kxcy.fsf@SSpaeth.de> (Sebastian Spaeth's message of "Thu, 
	15 Apr 2010 09:07:09 +0200")
Message-ID: <lyzl14x05z.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Scanned-By: MIMEDefang 2.67 on 62.153.82.30
X-SA-Exim-Connect-IP: 62.153.82.30
X-SA-Exim-Mail-From: enrico.scholz@sigma-chemnitz.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] dbus: use $(LIBTOOL) to install 'dbus-daemon'
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
X-List-Received-Date: Thu, 15 Apr 2010 14:29:23 -0000
Content-Type: text/plain; charset=us-ascii

"Sebastian Spaeth" <Sebastian@SSpaeth.de> writes:

>> Changing Makefile.am to use native automake methods to install this
>> files would be a better but more invasive fix.
>
> Looks reasonable, although I am always for going with the "better" fixes
> in general :-)

I will work on a better patch which will be sent to upstream.  But I can
not say when I have time to work on it.


Enrico


