Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 15CFB6CEF0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2013 18:34:36 +0000 (UTC)
Received: (qmail 8360 invoked by uid 1003); 10 Oct 2013 18:34:37 -0000
Received: from unknown (HELO ?192.168.1.103?) (philip@opensdr.com@108.44.88.68)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	10 Oct 2013 18:34:37 -0000
Message-ID: <5256F33C.50609@balister.org>
Date: Thu, 10 Oct 2013 14:34:36 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Enigmail-Version: 1.5.2
Subject: [RFC] Create meta-sdr in meta-oe
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
X-List-Received-Date: Thu, 10 Oct 2013 18:34:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

At the GNU Radio conference last week, several people working with
gnuradio on embedded systems asked about creating a meta-sdr to hold
gnuradio and uhd. This would be the starting point for adding some other
gnuradio out of tree applications. This could also be a home for some
other sdr frameworks such as Iris and ALOE.

Software that is more focused toward the amateur radio community should
not end up here since there is little overlap in the developer
communities at this time.

Any comments?

Philip

