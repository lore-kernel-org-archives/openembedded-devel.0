Received: from mail.gmx.net ([213.165.64.20])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <schnitzeltony@gmx.de>) id 1OX9Qt-0002aa-A6
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Jul 2010 10:59:45 +0200
Received: (qmail invoked by alias); 09 Jul 2010 08:54:49 -0000
Received: from mail2.zera.de (EHLO [192.168.142.128]) [62.225.102.139]
	by mail.gmx.net (mp006) with SMTP; 09 Jul 2010 10:54:49 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18bChN6TJwbmudbtPK9qS4J1iCt2qHsrKzsdeCE4D
	s7DbA6XuI1/3OD
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 9 Jul 2010 10:49:08 +0200
User-Agent: KMail/1.9.6 (enterprise 0.20071012.724442)
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA501819DAE@deimsg40.de.net.world>
In-Reply-To: <0B51A1E7C61D114DAE6FC10B0FD0ABA501819DAE@deimsg40.de.net.world>
MIME-Version: 1.0
Message-Id: <201007091049.09034.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.20
X-SA-Exim-Mail-From: schnitzeltony@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Best practice to resolve dependency loops ?
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
X-List-Received-Date: Fri, 09 Jul 2010 08:59:45 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday 09 July 2010 10:05:56 am Hauser, Wolfgang (external) wrote:
> What is the best practice to examine and solve such problems ?

I would like to add an additional question:

bitbake supports -g for dependency trees in dot syntax. What is the best tool to browse these files. I checked graphviz but this just paints complete unviewable posters. Is there e.g something like 
a dot to html converter aavialable?

Andreas


