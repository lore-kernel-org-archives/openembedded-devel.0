Received: from bosmailout06.eigbox.net ([66.96.186.6])
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from
	<SRS0=AHIgdk=DP=mindchasers.com=openembedded@eigbox.net>)
	id 1SSprQ-0004Eg-Bq for openembedded-devel@lists.openembedded.org;
	Fri, 11 May 2012 15:26:24 +0200
Received: from bosmailscan09.eigbox.net ([10.20.15.9])
	by bosmailout06.eigbox.net with esmtp (Exim) id 1SSpEH-0002BP-Bh
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 May 2012 08:45:53 -0400
Received: from bosimpout02.eigbox.net ([10.20.55.2])
	by bosmailscan09.eigbox.net with esmtp (Exim) id 1SSpEH-0003sL-42
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 May 2012 08:45:53 -0400
Received: from bosauthsmtp19.eigbox.net ([10.20.18.19])
	by bosimpout02.eigbox.net with NO UCE
	id 8cls1j00R0QhFXN01clsDU; Fri, 11 May 2012 08:45:52 -0400
X-Authority-Analysis: v=2.0 cv=XOuHv3dE c=1 sm=1
	a=pE7rXYWSHihduKiUhs7UFw==:17 a=mn2ndCrYJZwA:10 a=5XsFQGJ3Uf0A:10
	a=q2EyZ5gR_U8A:10 a=Lk7aQFya1KUA:10 a=8nJEP1OIZ-IA:10
	a=tpS_66VmtDQDhd64MZ4A:9 a=2oEa4wvFKc5eOtOgHtAA:7 a=wPNLvfGTeEIA:10
	a=9UqFsMnAB6EOkiq4MrOclQ==:117
X-EN-OrigOutIP: 10.20.18.19
X-EN-IMPSID: 8cls1j00R0QhFXN01clsDU
Received: from pool-108-25-187-176.atclnj.east.verizon.net ([108.25.187.176]
	helo=[192.168.1.3]) by bosauthsmtp19.eigbox.net with esmtpa (Exim)
	id 1SSpEG-00042q-Oo for openembedded-devel@lists.openembedded.org;
	Fri, 11 May 2012 08:45:52 -0400
Message-ID: <4FAD09FE.4040101@mindchasers.com>
Date: Fri, 11 May 2012 08:45:50 -0400
From: Bob Cochran <openembedded@mindchasers.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-EN-UserInfo: cb6d325fe03740ac93d537d78041f599:2186c883651a1065ea1e15c5a112545a
X-EN-AuthUser: bcochran@mindchasers.com
Sender: Bob Cochran <openembedded@mindchasers.com>
X-EN-OrigIP: 108.25.187.176
X-EN-OrigHost: pool-108-25-187-176.atclnj.east.verizon.net
Subject: finding mime-support in multiple oe trees?
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
X-List-Received-Date: Fri, 11 May 2012 13:26:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I can find recipes for mime-support in both meta-openembedded and 
meta-openembedded-contrib under meta-oe/recipes-support.  The former has 
a 3.48 recipe and the latter has a 3.44 recipe.

Is finding the same recipe in multiple trees (not including classic) a 
glitch or the norm?

I'm going on the assumption that a production image is best off pulling 
a recipe from a non contrib layer (when available) unless the contrib 
layer / recipe solves a specific need.

Thanks in advance for providing any insight into this issue of multiple 
recipes in different trees.

Bob


