Received: from [74.125.46.157] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aloisio.almeida@openbossa.org>) id 1JetEa-00030T-OA
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Mar 2008 15:37:40 +0100
Received: by yw-out-1718.google.com with SMTP id 9so64444ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Mar 2008 07:37:38 -0700 (PDT)
Received: by 10.142.131.18 with SMTP id e18mr1153930wfd.147.1206628657243;
	Thu, 27 Mar 2008 07:37:37 -0700 (PDT)
Received: by 10.70.116.10 with HTTP; Thu, 27 Mar 2008 07:37:37 -0700 (PDT)
Message-ID: <1d6c95c90803270737w7125208aia886a185e00df781@mail.gmail.com>
Date: Thu, 27 Mar 2008 11:37:37 -0300
From: "Aloisio Almeida" <aloisio.almeida@openbossa.org>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: Send specific patches to upstream
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
X-List-Received-Date: Thu, 27 Mar 2008 14:37:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all

Mamona project has 3 patches (2 for epsilon and 1 for python-epsilon)
that are specific to our distribution. As specif, these patches won't
be sent to upstream.
I added these patches using

SRC_URI_append_mamona = "file://<patch>;patch=1"

What about upload these patches, as they won't affect other projects?

Regards
Aloisio


