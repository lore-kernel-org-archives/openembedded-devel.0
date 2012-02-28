Received: from moutng.kundenserver.de ([212.227.17.10])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <robert@projekt131.de>) id 1S2NQU-0000WR-4M
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Feb 2012 14:49:10 +0100
Received: from freya ([129.217.182.56])
	by mrelayeu.kundenserver.de (node=mreu1) with ESMTP (Nemesis)
	id 0McAfD-1RkPlO1Q7r-00JeSD; Tue, 28 Feb 2012 13:59:37 +0100
From: "Robert Budde" <robert@projekt131.de>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 28 Feb 2012 13:59:36 +0100
Message-ID: <00ec01ccf618$d3302ea0$79908be0$@projekt131.de>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: Acz2GFrv9WaDj0tkTWeKt/cKNSERAw==
X-Provags-ID: V02:K0:LePY0huf83JvaTDcPLM4rlRetGrsQqtVLTA81svB2rZ
	TU1VT5bw1W5C1ubwiZqNJ5Oy/IC+y4Wyc9O53hnDpMN6YpNw82
	/k78xfkVmktIUNj9SLeqR/otMa1NRuU/+zVsxwEGjDLzGvTH0S
	9uth96ogi6kOde+E029yyI/IR9RYya00Epi1pdS5YMODDXrd0u
	0BqUV1cw1yq/YtDB/vSw78Np2gZEc3rtv15f7w+5Ygl0oH31Mn
	SSLyi0YzJK9zYjNItXlo26H/wPBmoIGleCVt+/WAGEL0WpzQc/
	h3LA75AbtKxj9lhndx/jCiA81Vc5Y158yEUfQrtdQt3Gjy7QP7
	8uHEmh+U70VuQhZW+9RSR4E9SSE6J3x5b4MQx9PcL
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Use existing file instead of pkg_postinst/pkg_postrm etc definition
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
X-List-Received-Date: Tue, 28 Feb 2012 13:49:10 -0000
Content-Language: de
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi!

 

Is it possible to use an existing file in the WORKDIR as a source for
example for the pkg_postinst action? The reason for this is that I am
repackaging some deb-packages and there are already the scripts in there.
Same could happen if the scripts are quite long and one wants to avoid
cluttering the .bb/.inc without an additional .inc-file.

 

Best regards,

Robert


