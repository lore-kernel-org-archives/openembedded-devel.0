Received: from mailout-de.gmx.net ([213.165.64.23] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <schnitzeltony@gmx.de>) id 1Oss8X-00085U-59
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 08:58:35 +0200
Received: (qmail invoked by alias); 07 Sep 2010 06:57:52 -0000
Received: from mail2.zera.de (EHLO [192.168.142.128]) [62.225.102.139]
	by mail.gmx.net (mp057) with SMTP; 07 Sep 2010 08:57:52 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+ndP8pD4GnpIQPWkWnkaJmsGRQeiBzI5w/U50hCX
	xpYviziWX5Thm6
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 7 Sep 2010 08:43:35 +0200
User-Agent: KMail/1.9.6 (enterprise 0.20071012.724442)
MIME-Version: 1.0
Message-Id: <201009070843.36066.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.23
X-SA-Exim-Mail-From: schnitzeltony@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: clutter patches status
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
X-List-Received-Date: Tue, 07 Sep 2010 06:58:35 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

the patches I sent on Sep. 3rd were acked by Koen and are marked as 'applied' in patchwork but I can't find them in org.openembedded.dev or any other branch.

I would like to send/implement further patches ontop:

- workaround clutter font problem (implemented & tested - waiting for upstream)
- clutter-gegl (TBD / required by toys/attic/gcr)
- clutter-helix (TBD / optionally required by toys/attic/woohaa)
- toys: multiple configure done / update to 1.0 interface (hope to get that upstream at clutter-project)
- pyclutter: implemented but build fails for GLES (GL ok)
- clutter-gesture (builds ok - don't know how to test yet)

Please let me know the status of the patches sent.

Andreas


