Received: from infosrv.imms.de ([194.95.250.51])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <thomas.elste@imms.de>) id 1OT9ei-00007X-2Z
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jun 2010 10:25:33 +0200
Received: from infosrv.imms.de (infosrv.imms.de [127.0.0.1])
	by IMSA (Postfix) with ESMTP id 39CFE260056
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jun 2010 10:20:31 +0200 (CEST)
Received: from proxy.imms.de (proxy.imms.de [194.95.250.53])
	by infosrv.imms.de (Postfix) with ESMTP id 1643B26004A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jun 2010 10:20:31 +0200 (CEST)
Received: from pluto ([172.16.10.24])
	by proxy.imms.de (8.13.8+Sun/8.13.8) with ESMTP id o5S8Kh7D027764
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jun 2010 10:20:43 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
References: <1277370374-4677-1-git-send-email-thomas.elste@imms.de>
	<1277370374-4677-2-git-send-email-thomas.elste@imms.de>
	<hvv8ko$skd$4@dough.gmane.org>
Date: Mon, 28 Jun 2010 10:20:25 +0200
MIME-Version: 1.0
From: "Thomas Elste" <thomas.elste@imms.de>
Organization: IMMS gGmbH
Message-ID: <op.vez34bqsaqzt3c@pluto>
In-Reply-To: <hvv8ko$skd$4@dough.gmane.org>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 194.95.250.51
X-SA-Exim-Mail-From: thomas.elste@imms.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] qwt: Add version 5.2.1
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
X-List-Received-Date: Mon, 28 Jun 2010 08:25:35 -0000
Content-Type: text/plain; charset=iso-8859-15; format=flowed; delsp=yes
Content-Transfer-Encoding: quoted-printable

Hi,

>> Add recipe for current version of Qwt. This new version uses qt4-class=
es
>> instead of palmtop. Different bb-files for Qt and Qt-Embedded
>> variant are provided. Qwt examples are also build. They get deployed i=
n
>> extra packages.

On Thu, 24 Jun 2010 11:31:04 +0200, Koen Kooi <k.kooi@student.utwente.nl>=
 wrote:
> Looks good enough to me, we can solve any other issues after it has bee=
n
> committed.
If the patch is ok so far, could you or somebody else commit it? I don't
have write access to the dev tree.


Thanks
Thomas


