Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <david.oe@pilsoft.com>) id 1ORw2U-0006CZ-Hw
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jun 2010 01:40:59 +0200
Received: by bwz14 with SMTP id 14so2745446bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jun 2010 16:36:22 -0700 (PDT)
Received: by 10.204.81.196 with SMTP id y4mr7027212bkk.75.1277422582562;
	Thu, 24 Jun 2010 16:36:22 -0700 (PDT)
Received: from [192.168.33.16] (mna75-2-82-67-197-228.fbx.proxad.net
	[82.67.197.228])
	by mx.google.com with ESMTPS id q2sm1253073bkj.22.2010.06.24.16.36.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 24 Jun 2010 16:36:21 -0700 (PDT)
From: David Hemmo <david.oe@pilsoft.com>
Date: Fri, 25 Jun 2010 01:36:19 +0200
Message-Id: <46D92548-C16C-4F1F-9924-946EDAE2EDAA@pilsoft.com>
To: openembedded-devel@lists.openembedded.org
Mime-Version: 1.0 (Apple Message framework v1081)
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: david.oe@pilsoft.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: What is the best way to remove gnome-vfs dependency from gst-plugins-base ?
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
X-List-Received-Date: Thu, 24 Jun 2010 23:40:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hello All,

If the answer is read the documentation and you can give me a pointer, =
it will be enough :-)

The standard gst-plugins-base recipe depends on gnome-vfs, but if I add =
--disable-gnome_vfs to configure, that dependency becomes useless.

Is there a way to add this configuration option and remove the =
dependency for my specific case without changing the recipe ?

Thanks

David Hemmo=


