Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1Lewr7-0004VL-2n
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 20:34:15 +0100
Received: (qmail 4012 invoked by uid 813007); 4 Mar 2009 19:29:59 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 19:29:59 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 4 Mar 2009 20:29:51 +0100
User-Agent: KMail/1.11.0 (Linux/2.6.29-rc6-00216-g778ef1e; KDE/4.2.0; x86_64; ;
	)
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
	<1236182004-4523-9-git-send-email-openembedded@haerwu.biz>
	<1236186706.10602.122.camel@andromeda>
In-Reply-To: <1236186706.10602.122.camel@andromeda>
MIME-Version: 1.0
Message-Id: <200903042029.52194.openembedded@haerwu.biz>
Subject: Re: [PATCH 08/70] rpm: Handle PYTHONVER differently in EXTRA_OECONF to stop gettext/uclibc failures during parsing (from Poky)
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
X-List-Received-Date: Wed, 04 Mar 2009 19:34:20 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 04 of March 2009 18:11:46 Michael 'Mickey' Lauer wrote:
>>  packages/rpm/rpm_4.4.2.3.bb |   16 ++++++++++------

> No. Better inherit distutils_base and use its PYTHON_DIR here.

done

Regards, 
-- 
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




