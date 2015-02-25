Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 57BD172D36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Feb 2015 00:46:48 +0000 (UTC)
Received: (qmail 16210 invoked by uid 1003); 25 Feb 2015 00:46:49 -0000
Received: from unknown (HELO ?10.16.32.77?)
	(philip@opensdr.com@209.234.137.234)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	25 Feb 2015 00:46:49 -0000
Message-ID: <54ED1B78.4040101@balister.org>
Date: Tue, 24 Feb 2015 16:46:48 -0800
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][dizzy]Update PyQt and related recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Feb 2015 00:46:49 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Please pull these three patches into meta-oe/dizzy.

https://github.com/openembedded/meta-oe/pull/19

These lead to a working PyQt4, which will reduce the number of questions
I get about gnuradio-companion not working on dizzy.

1) I apologize for using the meta-oe repo instead of meta-openembedded.
2) If this is annoying, I can send via email like a sane person.

Philip


